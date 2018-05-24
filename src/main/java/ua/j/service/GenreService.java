package ua.j.service;

import java.util.List;

import ua.j.entity.Genre;

public interface GenreService {

	void saveGenre(Genre genre);
	
	List<Genre> findAllGenres();
	
	Genre findGenreById(int id);
	
	void deleteGenreById (int id);
}
