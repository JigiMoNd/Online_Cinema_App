package ua.j.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.j.entity.Movie;

@Repository
public interface MovieRepository extends JpaRepository<Movie, Integer>{

}
