package ua.j.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.j.entity.Movie;
import ua.j.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {

	@Autowired
	private MovieService movieService;
	
	@GetMapping("/add-movie")
	public String ShowAddMovie(Model model) {
		model.addAttribute("movieModel", new Movie());
		
		return "movie/add-movie";
	}
	
	@PostMapping("/add-movie")
	public String saveMovie(@ModelAttribute("movieModel") Movie movie) {
		movieService.saveMovie(movie);
		
		return "redirect:/";
	}
		
}
