package ua.j.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.j.entity.Movie;
import ua.j.repository.MovieRepository;
import ua.j.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieRepository movieRepository;
	
	@Override
	public void saveMovie(Movie movie) {
		movieRepository.save(movie);
	}

	@Override
	public List<Movie> findAllMovies() {
		return movieRepository.findAll();
	}

	@Override
	public Movie findMovieById(int id) {
		return movieRepository.getOne(id);
	}

	@Override
	public void deleteMovieById(int id) {
		movieRepository.deleteById(id);
	}

}
