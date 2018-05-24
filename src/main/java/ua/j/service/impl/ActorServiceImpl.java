package ua.j.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.j.entity.Actor;
import ua.j.repository.ActorRepository;
import ua.j.service.ActorService;

@Service
public class ActorServiceImpl implements ActorService {

	@Autowired
	private ActorRepository actorRepository;
	
	@Override
	public void saveActor(Actor actor) {
		actorRepository.save(actor);
	}

	@Override
	public List<Actor> findAllActors() {
		return actorRepository.findAll();
	}

	@Override
	public Actor findActorById(int id) {
		return actorRepository.getOne(id);
	}

	@Override
	public void deleteActorById(int id) {
		actorRepository.deleteById(id);
	}

}
