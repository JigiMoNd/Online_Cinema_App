package ua.j.service;

import java.util.List;

import ua.j.entity.Country;

public interface CountryService {

	void saveCountry(Country country);
	
	List<Country> findAllCountries();
	
	Country findCountryById(int id);
	
	void deleteCountryById (int id);
}
