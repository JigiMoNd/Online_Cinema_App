package ua.j.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.j.entity.Genre;
import ua.j.repository.GenreRepository;
import ua.j.service.GenreService;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	private GenreRepository genreRepository;
	
	@Override
	public void saveGenre(Genre genre) {
		genreRepository.save(genre);
	}

	@Override
	public List<Genre> findAllGenres() {
		return genreRepository.findAll();
	}

	@Override
	public Genre findGenreById(int id) {
		return genreRepository.getOne(id);
	}

	@Override
	public void deleteGenreById(int id) {
		genreRepository.deleteById(id);
	}

}
