package ua.j.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ua.j.domain.SimpleFilter;
import ua.j.entity.Actor;

public interface ActorService {
	
	void saveActor(Actor actor);
	
	List<Actor> findAllActors();
	
	Actor findActorById(int id);

	void updateActor(Actor actor);
	
	void deleteActorById (int id);
	
	List<Actor> FindAllActorsByFilter(SimpleFilter filter);
	
	Page<Actor> FindActorsByPage(Pageable pageable);
}
