package ua.j.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ua.j.domain.EditRequest;
import ua.j.entity.User;
import ua.j.entity.enums.UserGender;
import ua.j.mapper.UserMapper;
import ua.j.service.UserService;

@Controller
@RequestMapping("/unconfirmed")
public class UnconfirmedController {
	

	@Autowired
	private UserService userService;
	
	@GetMapping("/profile")
	public String showProfile(Model model, Principal principal) {
		User user = userService.findUserById(Integer.valueOf(principal.getName()));
		model.addAttribute("userProfile", user);
		return "unconfirmed/profile";
	}

	@GetMapping("/edit-profile")
	public String showEditProfile(Model model, Principal principal) {
//		String id = principal.getName();
		User user = userService.findUserById(Integer.valueOf(principal.getName()));

		model.addAttribute("gender", UserGender.values());
		model.addAttribute("editModel", UserMapper.userToEditRequest(user));
		model.addAttribute("userProfile", userService.findUserById(Integer.valueOf(principal.getName())));
		
		return "unconfirmed/edit-profile";
	}
	
	@PostMapping("/edit-profile")
	public ModelAndView saveEditedUser(@ModelAttribute("editModel") EditRequest editRequest) {
		try {
			userService.updateUser(UserMapper.editRequestToUser(editRequest));
		} catch (Exception e) {
			return new ModelAndView("edit-profile", "error" , "Oops.. Something went wrong. \n It`s not your fault. \n But also it's not programmer's fault");
		}
		
		return new ModelAndView("redirect:/unconfirmed/profile");
	}
	
	
	
}
