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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;
import ua.j.domain.EditRequest;
import ua.j.domain.RegistrationRequest;
import ua.j.entity.User;
import ua.j.entity.enums.UserGender;
import ua.j.mapper.UserMapper;
import ua.j.service.UserService;
import ua.j.service.cloudinary.CloudinaryService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CloudinaryService cloudinaryService;

	@GetMapping("/profile/image")
	public String uploadProfileImage() {
		return "user/upload-image";
	}
	@PostMapping("/profile/image/upload")
	public String upload(@RequestParam("profileImage") MultipartFile file, Principal principal) {
		User user = userService.findUserById(Integer.valueOf(principal.getName()));
		String imageUrl = cloudinaryService.uploadFile(file, "user/" + user.getId());
		user.setImageUrl(imageUrl);
		userService.updateUser(user);
		
		return "redirect:/profile";
	}
	
}
