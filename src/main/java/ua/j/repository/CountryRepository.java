package ua.j.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.j.entity.Country;

@Repository
public interface CountryRepository extends JpaRepository<Country, Integer>{

}