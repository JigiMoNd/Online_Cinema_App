package ua.j.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.j.entity.Actor;

@Repository
public interface ActorRepository extends JpaRepository<Actor, Integer>{

}