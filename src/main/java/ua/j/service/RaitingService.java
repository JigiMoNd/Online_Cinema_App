package ua.j.service;

import java.util.List;

import ua.j.entity.Raiting;

public interface RaitingService {
	
	void saveRaiting(Raiting raiting);
	
	List<Raiting> findAllRaitings();
	
	Raiting findRaitingById(String id);
	
	void updateRaiting(Raiting raiting);
	
	void deleteRaitingById (String id);
}
