package ua.j.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.j.entity.Actor;
import ua.j.service.ActorService;
import ua.j.service.CountryService;
import ua.j.service.MovieService;
import ua.j.service.UserService;

@Controller
@RequestMapping("/actor")
public class ActorController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private ActorService actorService;
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/add-actor")
	public String ShowAddActor(Model model, Principal principal) {
		model.addAttribute("actorModel", new Actor());
		model.addAttribute("countries", countryService.findAllCountries());
		model.addAttribute("movies", movieService.findAllMovies());
		model.addAttribute("userProfile", userService.findUserById(Integer.valueOf(principal.getName())));
		
		return "actor/add-actor";
	}
	
	@PostMapping("/add-actor")
	public String saveActor(@ModelAttribute("actorModel") Actor actor) {
		actorService.saveActor(actor);
		
		return "redirect:/";
	}
	
	
	
}
