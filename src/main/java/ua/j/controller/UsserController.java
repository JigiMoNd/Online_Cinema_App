package ua.j.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;
import ua.j.domain.RegistrationRequest;
import ua.j.entity.enums.UserGender;
import ua.j.mapper.UserMapper;
import ua.j.service.UserService;

@Controller
@RequestMapping("/users")
@Log4j2
public class UsserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/registration")
	public String ShowRegistration(Model model) {
		model.addAttribute("userModel", new RegistrationRequest());
		model.addAttribute("gender", UserGender.values());
		
		return "/users/registration";
	}
	
	@PostMapping("/registration")
	public String registerUser(
			@Valid @ModelAttribute("userModel") RegistrationRequest request, BindingResult br) {
		log.debug("Try to save user: " + request.getEmail());
		if(br.hasErrors()) {
			log.debug("Error heppened: " + request);
			return "users/registration";
		}
		
		userService.saveUser(UserMapper.RegistrationRequestToUser(request));
		
		return "redirect:/login";
	}
}
