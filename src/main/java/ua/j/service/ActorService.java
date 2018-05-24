package ua.j.service;

import java.util.List;

import ua.j.entity.Actor;

public interface ActorService {
	
	void saveActor(Actor actor);
	
	List<Actor> findAllActors();
	
	Actor findActorById(int id);
	
	void deleteActorById (int id);
}
