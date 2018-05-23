package ua.j.service;

import java.util.List;

import ua.j.entity.Movie;

public interface MovieService {
	
	void saveMovie(Movie movie);
	
	List<Movie> findAllMovies();
	
	Movie findMovieById(int id);
	
	void deleteMovieById (int id);
}
