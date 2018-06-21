package ua.j;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.security.crypto.password.PasswordEncoder;

import ua.j.entity.Country;
import ua.j.entity.User;
import ua.j.entity.enums.UserRole;
import ua.j.repository.CountryRepository;
import ua.j.repository.UserRepository;

@SpringBootApplication
public class CinemAppApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		ConfigurableApplicationContext context = SpringApplication.run(CinemAppApplication.class, args);
		addUsers(context);
		addCountries(context);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(CinemAppApplication.class);
	}
	
	static void addUsers(ConfigurableApplicationContext context) {
		String email = "jigimond@gmail.com";
		String password = "123";
		
		UserRepository userRepository = context.getBean(UserRepository.class);
		User user = userRepository.findUserByEmail(email);
		
		if(user == null) {
			PasswordEncoder passwordEncoder = context.getBean(PasswordEncoder.class);
			user = new User();
			user.setEmail(email);
			user.setPassword(passwordEncoder.encode(password));
			user.setRole(UserRole.ROLE_ADMIN);
			
			userRepository.save(user);
			
			user = new User();
			user.setEmail("motryn@mail.ru");
			user.setPassword(passwordEncoder.encode(password));
			user.setRole(UserRole.ROLE_USER);

			userRepository.save(user);
			
			
		}
			
	}
	
    private static List<String> reading(String fileName) {
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(fileName);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("неправильна назва файлу");
		}
		InputStreamReader isr = new InputStreamReader(fis);		
		BufferedReader reader = new BufferedReader(isr);
	    List<String> values = new ArrayList<String>();
		try {
		    StringBuilder sb = new StringBuilder();
		    String line = reader.readLine();
		    while (line != null) {
		    	sb.append(line);
		    	values.add(sb.toString());
		    	sb.delete(0, sb.length());
		        line = reader.readLine();
		    }
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return values;
    } 
    
    private static void addCountries(ConfigurableApplicationContext context) {
    	CountryRepository countryRepository = context.getBean(CountryRepository.class);
		long countryCheck = countryRepository.count();
		if(countryCheck == 0) {
	    	List<String> countries = reading("countries.txt");
	    	for (int i = 0; i < countries.size(); i++) {
	    		Country country = new Country();
	    		country.setName(countries.get(i));
	    	
	    		countryRepository.save(country);
	    		}
			}
    	}
	
}
