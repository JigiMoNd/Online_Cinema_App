package ua.j.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;
import ua.j.domain.EditRequest;
import ua.j.domain.RegistrationRequest;
import ua.j.entity.User;
import ua.j.entity.enums.UserGender;
import ua.j.entity.enums.UserRole;
import ua.j.mail.Mail;
import ua.j.mapper.UserMapper;
import ua.j.service.EmailService;
import ua.j.service.UserService;
import ua.j.service.utils.RandomToken;


@Controller
@Log4j2
public class HomeController {
	

	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	
//	@GetMapping("/")
//	public String showHome( ) {
//		return "home";
//	}

	@GetMapping("/")
	public ModelAndView showHome() {
		return new ModelAndView("home");
	}
	

	@GetMapping("/login")
	public ModelAndView showLogin() {
		return new ModelAndView("login");
	}
	@GetMapping("/registration")
	public String showRegistration(Model model, Principal principal) {
		model.addAttribute("userModel", new RegistrationRequest());
		model.addAttribute("gender", UserGender.values());
//		model.addAttribute("userProfile", userService.findUserById(Integer.valueOf(principal.getName())));
		
		return "registration";
	}
	
	@PostMapping("/registration")
	public String registerUser(
			@Valid @ModelAttribute("userModel") RegistrationRequest request, BindingResult br, Model model) {
		log.debug("Try to save user: " + request.getEmail());
		if(br.hasErrors()) {
			log.debug("Error heppened: " + request);
			model.addAttribute("userModel", new RegistrationRequest());//що дає тут цей рядок?
			return "registration";
		}
		User user = UserMapper.registrationRequestToUser(request);
		String token = RandomToken.generateToken();
		user.setToken(token);
		
		userService.saveUser(user);
		
		Mail mail = new Mail();
		mail.setTo(request.getEmail());
		mail.setSubject("Registration confirm");
		mail.setContent(
				"You are successfully registered on our site\n "
				+ "Please confirm your registration\n "
				+ "Press link to confirm:\n" 
				+ "http://localhost:8080/verify?token=" + token + "&userid=" + user.getId());
		
		emailService.sendMessage(mail);
		
		return "redirect:/login";
	}
	
	@GetMapping("/verify")
	public String verifyEmail(
		@RequestParam("token") String token,
		@RequestParam("userid") String userId
			) {
		
		User user = userService.findUserById(Integer.valueOf(userId));
		if (user.getToken().equals(token)) {
			user.setToken(null);
			user.setRole(UserRole.ROLE_USER);
			userService.updateUser(user);
		} else {
			return "redirect:/?validate=false";
		}

		return "home";
	}

	@GetMapping("/profile")
	public String showProfile(Model model, Principal principal) {
		User user = userService.findUserById(Integer.valueOf(principal.getName()));
		model.addAttribute("userProfile", user);
		return "profile";
	}

	@GetMapping("/edit-profile")
	public String showEditProfile(Model model, Principal principal) {
//		String id = principal.getName();
		User user = userService.findUserById(Integer.valueOf(principal.getName()));

		model.addAttribute("gender", UserGender.values());
		model.addAttribute("editModel", UserMapper.userToEditRequest(user));
		model.addAttribute("userProfile", userService.findUserById(Integer.valueOf(principal.getName())));
		
		return "edit-profile";
	}
	
	@PostMapping("/edit-profile")
	public ModelAndView saveEditedUser(@ModelAttribute("editModel") EditRequest editRequest) {
		try {
			userService.updateUser(UserMapper.editRequestToUser(editRequest));
		} catch (Exception e) {
			return new ModelAndView("edit-profile", "error" , "Oops.. Something went wrong. \n It`s not your fault. \n But also it's not programmer's fault");
		}
		
		return new ModelAndView("redirect:/profile");
	}
	
	
	
	
	
}
