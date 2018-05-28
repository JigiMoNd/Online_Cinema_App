package ua.j.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import ua.j.entity.Movie;
import ua.j.entity.enums.AgeLimit;
import ua.j.service.CountryService;
import ua.j.service.GenreService;
import ua.j.service.MovieService;
import ua.j.service.UserService;

@Controller
@RequestMapping("/movie")
@SessionAttributes({"countries", "genres"})
public class MovieController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private GenreService genreService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/add-movie")
	public String ShowAddMovie(Model model, Principal principal) {
		model.addAttribute("movieModel", new Movie());
		model.addAttribute("countries", countryService.findAllCountries());
		model.addAttribute("genres", genreService.findAllGenres());
		model.addAttribute("ageLimit", AgeLimit.values());
		model.addAttribute("userProfile", userService.findUserById(Integer.valueOf(principal.getName())));
		
		
		return "movie/add-movie";
	}
	
	@PostMapping("/add-movie")
	public String saveMovie(@ModelAttribute("movieModel") Movie movie) {
		movieService.saveMovie(movie);
		
		return "redirect:/";
	}
		
}
