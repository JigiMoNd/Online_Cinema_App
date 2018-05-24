package ua.j.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.j.entity.Actor;
import ua.j.service.ActorService;

@Controller
@RequestMapping("/actor")
public class ActorController {

	
	@Autowired
	private ActorService actorService;
	
	@GetMapping("/add-actor")
	public String ShowAddActor(Model model) {
		model.addAttribute("actorModel", new Actor());
		
		return "actor/add-actor";
	}
	
	@PostMapping("/add-actor")
	public String saveActor(@ModelAttribute("movieActor") Actor actor) {
		actorService.saveActor(actor);
		
		return "redirect:/";
	}
	
	
	
}
