package ua.j.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/moderator")
public class ModeratorController {

	@GetMapping("/list-of-users")
	public String showUsers() {
		return "moderator/list-of-users";
	}
	
	
}
