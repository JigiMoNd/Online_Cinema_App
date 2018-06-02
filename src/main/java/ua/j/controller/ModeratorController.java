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
import ua.j.entity.Movie;
import ua.j.entity.User;
import ua.j.entity.enums.UserGender;
import ua.j.mapper.UserMapper;
import ua.j.service.ActorService;
import ua.j.service.MovieService;
import ua.j.service.cloudinary.CloudinaryService;

@Controller
@RequestMapping("/moderator")
public class ModeratorController {
//	String imageUrl = cloudinaryService.uploadFile(file, "user/" + user.getId());

	@Autowired
	private CloudinaryService cloudinaryService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ActorService actorService;

	@GetMapping("/list-of-users")
	public String showUsers() {
		return "moderator/list-of-users";
	}

//	@GetMapping("/edit-movie")
//	public String showEditMovie(Model model, Principal principal) {
////		String id = principal.getName();
//		Movie movie = movieService.findMovieById(id);
//
//		model.addAttribute("gender", UserGender.values());
//		model.addAttribute("editModel", UserMapper.userToEditRequest(user));
//		model.addAttribute("userProfile", userService.findUserById(Integer.valueOf(principal.getName())));
//		
//		return "moderator/edit-movie";
//	}
	
//	@PostMapping("/edit-profile")
//	public ModelAndView saveEditedUser(@ModelAttribute("editModel") EditRequest editRequest) {
//		try {
//			userService.updateUser(UserMapper.editRequestToUser(editRequest));
//		} catch (Exception e) {
//			return new ModelAndView("edit-profile", "error" , "Oops.. Something went wrong. \n It`s not your fault. \n But also it's not programmer's fault");
//		}
//		
//		return new ModelAndView("redirect:/unconfirmed/profile");
//	}
	@GetMapping("/dashboard")
	public String showDashboard() {
		return "moderator/dashboard";
	}

	
}
