package ua.j.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ua.j.domain.EditRequest;
import ua.j.entity.Actor;
import ua.j.entity.Movie;
import ua.j.entity.User;
import ua.j.entity.enums.AgeLimit;
import ua.j.entity.enums.UserGender;
import ua.j.mapper.UserMapper;
import ua.j.service.ActorService;
import ua.j.service.CountryService;
import ua.j.service.GenreService;
import ua.j.service.MovieService;
import ua.j.service.UserService;
import ua.j.service.cloudinary.CloudinaryService;

@Controller
@RequestMapping("/moderator")
public class ModeratorController {
//	String imageUrl = cloudinaryService.uploadFile(file, "user/" + user.getId());

	@Autowired
	private CountryService countryService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ActorService actorService;
	@Autowired
	private GenreService genreService;
	@Autowired
	private UserService userService;

	@GetMapping("/list-of-users")
	public String showUsers(
			Model model,
			Principal principal) {
		User user = userService.findUserById(Integer.valueOf(principal.getName()));
		model.addAttribute("userProfile", user);
		
		return "moderator/list-of-users";
	}

	@GetMapping("/edit-actor/{actorId}")
	public String editActorById(
			@PathVariable("actorId") int actorId,
			Model model,
			Principal principal) {
		User user = userService.findUserById(Integer.valueOf(principal.getName()));
		model.addAttribute("userProfile", user);
		
		Actor actor = actorService.findActorById(actorId);
		model.addAttribute("actorModel", actor);
		model.addAttribute("movies", movieService.findAllMovies());
		model.addAttribute("countries", countryService.findAllCountries());
		
		
		actorService.updateActor(actor);
		
		return "moderator/edit-actor";
	}
	
	@PostMapping("/edit-actor")
	public String updateActor(
			@ModelAttribute("actorModel")
			Actor actor) {
		actorService.updateActor(actor);
		return "redirect:/list-of-actors";
	}
	
	@GetMapping("edit-movie/{movieId}")
	public String editMovieById(
			@PathVariable("movieId") int movieId,
			Model model,
			Principal principal) {
		User user = userService.findUserById(Integer.valueOf(principal.getName()));
		model.addAttribute("userProfile", user);
		
		Movie movie = movieService.findMovieById(movieId);
		model.addAttribute("movieModel", movie);
		model.addAttribute("countries", countryService.findAllCountries());
		model.addAttribute("genres", genreService.findAllGenres());
		model.addAttribute("ageLimit", AgeLimit.values());
		
		movieService.updateMovie(movie);
		
		return "moderator/edit-movie";
	}

	@PostMapping("/edit-movie")
	public String updateMovie(
			@ModelAttribute("movieModel")
			Movie movie) {
		movieService.updateMovie(movie);
		return "redirect:/list-of-movies";
	}
	
	
}
