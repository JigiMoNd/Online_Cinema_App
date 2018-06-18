package ua.j.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ua.j.domain.SimpleFilter;
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

	@Override
	public List<Actor> FindAllActorsByFilter(SimpleFilter filter) {
		return null;
	}

	@Override
	public Page<Actor> FindActorsByPage(Pageable pageable) {
			PageRequest pageRequest = 
					new PageRequest
					(pageable.getPageNumber(),
					pageable.getPageSize(),
					pageable.getSort());
			
		return actorRepository.findAll(pageRequest);
	}

	@Override
	@Transactional
	public void updateActor(Actor actor) {
		actorRepository.save(actor);
	}

}
