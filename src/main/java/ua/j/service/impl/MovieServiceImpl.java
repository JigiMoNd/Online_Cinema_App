package ua.j.service.impl;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import ua.j.domain.SimpleFilter;
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

	@Override
	public List<Movie> FindAllMoviesByFilter(SimpleFilter filter) {
		return movieRepository.findAll(getSpecification(filter));
		}
	
		private Specification<Movie> getSpecification(SimpleFilter filter) {
			return new Specification<Movie>() {
				private static final long serialVersionUID = 1L;
				
				@Override
				public Predicate toPredicate(Root<Movie> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					if (filter.getSearch().isEmpty()) return null;
					
					return cb.like(root.get("name"), "%" + filter.getSearch() + "%");
				}
			};
		}

	@Override
	public Page<Movie> FindMovieByPage(Pageable pageable) {
		PageRequest pageRequest = 
				new PageRequest(
						pageable.getPageNumber(), 
						pageable.getPageSize(),
						pageable.getSort());
				
		return movieRepository.findAll(pageRequest);
	}

	@Override
	@Transactional
		public void updateMovie(Movie movie) {
			movieRepository.save(movie);
		
	}

}
