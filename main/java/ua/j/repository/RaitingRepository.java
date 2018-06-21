package ua.j.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.j.entity.Raiting;

@Repository
public interface RaitingRepository  extends JpaRepository<Raiting, String>{

}
