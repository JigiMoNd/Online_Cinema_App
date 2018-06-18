package ua.j.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ua.j.domain.SimpleFilter;
import ua.j.entity.Movie;

public interface MovieService {
	
	void saveMovie(Movie movie);
	
	List<Movie> findAllMovies();
	
	Movie findMovieById(int id);
	
	void updateMovie(Movie movie);
	
	void deleteMovieById (int id);
	
	List<Movie> FindAllMoviesByFilter(SimpleFilter filter);
	
	Page<Movie> FindMovieByPage(Pageable pageable);
}
