package ua.j.controller;


import java.security.Principal;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import ua.j.entity.Actor;
import ua.j.entity.Movie;
import ua.j.entity.enums.AgeLimit;
import ua.j.service.ActorService;
import ua.j.service.CountryService;
import ua.j.service.GenreService;
import ua.j.service.MovieService;
import ua.j.service.UserService;
import ua.j.service.cloudinary.CloudinaryService;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"countries", "genres"})
public class AdminController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private GenreService genreService;
	@Autowired
	private UserService userService;
	@Autowired
	private ActorService actorService;
	@Autowired
	private CloudinaryService cloudinaryService;
	
	@GetMapping("/add-movie")
	public String ShowAddMovie(Model model, Principal principal) {
		model.addAttribute("movieModel", new Movie());
		model.addAttribute("countries", countryService.findAllCountries());
		model.addAttribute("genres", genreService.findAllGenres());
		model.addAttribute("ageLimit", AgeLimit.values());
		model.addAttribute("userProfile", userService.findUserById(Integer.valueOf(principal.getName())));
		
		
		return "admin/add-movie";
	}
	
	@PostMapping("/add-movie")
	public String saveMovie(
			@ModelAttribute("movieModel") Movie movie,
			@RequestParam("poster") MultipartFile file) {
		movieService.saveMovie(movie);
	try {
		String imageUrl = cloudinaryService.uploadFile(file, "movie/" + movie.getId());
		movie.setImageUrl(imageUrl);
		movieService.saveMovie(movie);
		} catch (StringIndexOutOfBoundsException e) {
			movie.setImageUrl("http://res.cloudinary.com/jigimond/image/upload/v1527796082/default_poster.jpg");
			movieService.saveMovie(movie);
					
			return "redirect:/";
		}
		
		
		return "redirect:/";
	}
	
	@GetMapping("/add-actor")
	public String showAddActor(Model model, Principal principal) {
		model.addAttribute("actorModel", new Actor());
		model.addAttribute("countries", countryService.findAllCountries());
		model.addAttribute("movies", movieService.findAllMovies());
		return "admin/add-actor";
	}
	
	@PostMapping("/add-actor")
	public String saveActor(@ModelAttribute("acmtorModel") Actor actor) {
		actorService.saveActor(actor);
		return "redirect:/";
	}
}
