package ua.j.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.j.entity.Raiting;
import ua.j.repository.RaitingRepository;
import ua.j.service.RaitingService;

@Service
public class RaitingServiceImpl implements RaitingService {
	
	@Autowired
	private RaitingRepository raitingRepository;
	
	@Override
	public void saveRaiting(Raiting raiting) {
		raitingRepository.save(raiting);
	}

	@Override
	public List<Raiting> findAllRaitings() {
		return raitingRepository.findAll();
	}

	@Override
	public Raiting findRaitingById(String id) {
		return raitingRepository.getOne(id);
	}

	@Override
	public void updateRaiting(Raiting raiting) {
		raitingRepository.save(raiting);
	}

	@Override
	public void deleteRaitingById(String id) {
		raitingRepository.deleteById(id);
	}

}
