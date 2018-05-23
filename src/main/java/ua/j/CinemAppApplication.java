package ua.j;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.security.crypto.password.PasswordEncoder;

import ua.j.entity.User;
import ua.j.entity.enums.UserRole;
import ua.j.repository.UserRepository;

@SpringBootApplication
public class CinemAppApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		ConfigurableApplicationContext context = SpringApplication.run(CinemAppApplication.class, args);
		addUsers(context);
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
	
}
