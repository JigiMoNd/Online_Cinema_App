package ua.j.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;
import ua.j.domain.RegistrationRequest;
import ua.j.entity.Movie;
import ua.j.mapper.UserMapper;
import ua.j.service.MovieService;
import ua.j.service.UserService;

@Controller
@Log4j2
@SessionAttributes({"halls", "movies"})
public class HomeController {

	@Autowired
	private UserService userService;
	@Autowired
	private MovieService movieService;
	
//	@GetMapping("/")
//	public String showHome( ) {
//		return "home";
//	}

	@GetMapping("/")
	public ModelAndView showHome( ) {
		return new ModelAndView("home");
	}
	

	@GetMapping("/login")
	public ModelAndView showLogin() {
		return new ModelAndView("login");
	}
		
	@GetMapping("/movie/add-movie")
	public String ShowAddMovie(Model model) {
		model.addAttribute("movieModel", new Movie());
		
		return "movie/add-movie";
	}
	
	@PostMapping("/movie/add-movie")
	public String saveMovie(@ModelAttribute("movieModel") Movie movie) {
		movieService.saveMovie(movie);
		
		return "redirect:/movie/add-movie";
	}
		
	@GetMapping("/users/registration")
	public String ShowRegistration(Model model) {
		model.addAttribute("userModel", new RegistrationRequest());
		
		return "/users/registration";
	}
	
	@PostMapping("/users/registration")
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
