package ua.j.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;
import ua.j.domain.RegistrationRequest;
import ua.j.entity.Actor;
import ua.j.entity.Movie;
import ua.j.entity.User;
import ua.j.entity.enums.UserGender;
import ua.j.entity.enums.UserRole;
import ua.j.mail.Mail;
import ua.j.mapper.UserMapper;
import ua.j.service.ActorService;
import ua.j.service.EmailService;
import ua.j.service.MovieService;
import ua.j.service.UserService;
import ua.j.service.utils.RandomToken;
import ua.j.domain.SimpleFilter;

@Controller
@Log4j2
public class HomeController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private ActorService actorService;
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;

	// @GetMapping("/")
	// public String showHome( ) {
	// return "home";
	// }

	@GetMapping("/")
	public ModelAndView showHome(Model model, Principal principal) {
		try {
			User user = userService.findUserById(Integer.valueOf(principal.getName()));
			model.addAttribute("userProfile", user);
		} catch (NullPointerException e) {
			return new ModelAndView("home");
		}

		return new ModelAndView("home");
	}

	@GetMapping("/login")
	public ModelAndView showLogin() {
		return new ModelAndView("login");
	}

	@GetMapping("/registration")
	public String showRegistration(Model model, Principal principal) {
		model.addAttribute("userModel", new RegistrationRequest());
		model.addAttribute("gender", UserGender.values());

		return "registration";
	}

	@PostMapping("/registration")
	public String registerUser(@Valid @ModelAttribute("userModel") RegistrationRequest request, BindingResult br,
			Model model) {
		log.debug("Try to save user: " + request.getEmail());
		if (br.hasErrors()) {
			log.debug("Error heppened: " + request);
			model.addAttribute("userModel", new RegistrationRequest());
			return "registration";
		}
		User user = UserMapper.registrationRequestToUser(request);
		String token = RandomToken.generateToken();
		user.setToken(token);

		userService.saveUser(user);

		Mail mail = new Mail();
		mail.setTo(request.getEmail());
		mail.setSubject("Registration confirm");
		mail.setContent("You are successfully registered on our site\n " + "Please confirm your registration\n "
				+ "Press link to confirm:\n" + "http://localhost:8080/verify?token=" + token + "&userid="
				+ user.getId());

		emailService.sendMessage(mail);

		return "redirect:/login";
	}

	@GetMapping("/verify")
	public String verifyEmail(@RequestParam("token") String token, @RequestParam("userid") String userId) {
		User user = userService.findUserById(Integer.valueOf(userId));

		if (user.getToken().equals(token)) {
			user.setToken(null);
			user.setRole(UserRole.ROLE_USER);
			userService.updateUser(user);
		} else {
			return "redirect:/?validate=false";
		}

		return "home";
	}

	@GetMapping("/list-of-movies")
	public String showMovies(Model model, @PageableDefault Pageable pageable, Principal principal) {
		Page<Movie> page = movieService.FindMovieByPage(pageable);

		int currentPage = page.getNumber();
		int begin = Math.max(1, currentPage - 4);
		int end = Math.min(begin + 4, page.getNumber());

		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("currentIndex", currentPage);

		model.addAttribute("movies", page);
		model.addAttribute("moviesByPageSize", page.getContent());// movieService.findAllMovies());

		try {
			User user = userService.findUserById(Integer.valueOf(principal.getName()));
			model.addAttribute("userProfile", user);
		} catch (NullPointerException e) {
			return "list-of-movies";
		}

		return "list-of-movies";
	}
	
	@GetMapping("/search")
	public String showSearchResults	(
			Model model, 
			@PageableDefault Pageable pageable, 
			Principal principal) {
		Page<Movie> page = movieService.FindMovieByPage(pageable);

		int currentPage = page.getNumber();
		int begin = Math.max(1, currentPage - 5);
		int end = Math.min(begin + 5, page.getNumber());

		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("currentIndex", currentPage);

		model.addAttribute("movies", page);
		model.addAttribute("moviesByPageSize", page.getContent());// movieService.findAllMovies());

		try {
			User user = userService.findUserById(Integer.valueOf(principal.getName()));
			model.addAttribute("userProfile", user);
		} catch (NullPointerException e) {
			return "search";
		}

		return "search";
	}

	@GetMapping("/list-of-movies/search")
	public String showMoviesByFilter(
			Model model, 
			@RequestParam(value = "search", required = false) 
			String search,
			Principal principal
			) {

		SimpleFilter filter = null;
		if (search != null) {
			filter = new SimpleFilter(search);
		}
		model.addAttribute("moviesByPageSize", movieService.FindAllMoviesByFilter(filter));
		model.addAttribute("actorListByPageSize", actorService.FindAllActorsByFilter(filter));
		
			try {
				User user = userService.findUserById(Integer.valueOf(principal.getName()));
				model.addAttribute("userProfile", user);
			} catch (NullPointerException e) {
				return "search"; // додано до всіх методів jsp-шок щоб відображалась аватарка
			}
		return "search";
	}

	@GetMapping("/list-of-actors")
	public String showActors(Model model, @PageableDefault Pageable pageable, Principal principal) {

		Page<Actor> page = actorService.FindActorsByPage(pageable);

		int currentPage = page.getNumber();
		int begin = Math.max(1, currentPage - 4);
		int end = Math.min(begin + 4, page.getNumber());

		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("currentIndex", currentPage);

		model.addAttribute("actorsList", page);
		model.addAttribute("actorListByPageSize", page.getContent());

		try {
			User user = userService.findUserById(Integer.valueOf(principal.getName()));
			model.addAttribute("userProfile", user);
		} catch (NullPointerException e) {
			return "list-of-actors";
		}

		return "list-of-actors";
	}

	@GetMapping("/movie/{movieId}")
	public String watchMovieById(@PathVariable("movieId") int movieId, Model model, Principal principal) {
		try {
			Movie movie = movieService.findMovieById(movieId);
			model.addAttribute("movieModel", movie);
			model.addAttribute("title", movie.getName());

			try {
				User user = userService.findUserById(Integer.valueOf(principal.getName()));
				model.addAttribute("userProfile", user);
			} catch (NullPointerException e) {
				return "movie";
			}

		} catch (javax.persistence.EntityNotFoundException i) {
			return "movie-not-found";
		}

		return "movie";
	}

	@GetMapping("/actor/{actorId}")
	public String showActorById(@PathVariable("actorId") int actorId, Model model, Principal principal) {

		try {
			Actor actor = actorService.findActorById(actorId);
			model.addAttribute("actorModel", actor);
			model.addAttribute("title", actor.getFullName());

			try {
				User user = userService.findUserById(Integer.valueOf(principal.getName()));
				model.addAttribute("userProfile", user);
			} catch (NullPointerException e) {
				return "actor";
			}

		} catch (javax.persistence.EntityNotFoundException e) {
			return "actor-not-found";
		}

		return "actor";
	}

}
