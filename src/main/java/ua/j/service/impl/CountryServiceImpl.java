package ua.j.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.j.entity.Country;
import ua.j.repository.CountryRepository;
import ua.j.service.CountryService;

@Service
public class CountryServiceImpl implements CountryService {

	@Autowired
	private CountryRepository countryRepository;
	
	@Override
	public void saveCountry(Country country) {
		countryRepository.save(country);
	}

	@Override
	public List<Country> findAllCountries() {
		return countryRepository.findAll();
	}

	@Override
	public Country findCountryById(int id) {
		return countryRepository.getOne(id);
	}

	@Override
	public void deleteCountryById(int id) {
		countryRepository.deleteById(id);
	}

}
