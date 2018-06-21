package ua.j.domain;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ua.j.entity.enums.UserGender;
import ua.j.validator.CheckIfEmailExists;
import ua.j.validator.CheckPasswordMatch;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@CheckPasswordMatch
public class RegistrationRequest {

	@NotEmpty(message = "field \"first name\" can\'t be empty")
	private String firstName; 

	@NotEmpty(message = "field \"last name\" can\'t be empty")
	private String lastName; 

	@NotEmpty(message = "field \"email\" can\'t be empty")
	@CheckIfEmailExists
	private String email;

	@NotEmpty(message = "field \"password\" can\'t be empty")
	private String password;

	@NotEmpty(message = "field \"password confirm\" can\'t be empty")
	private String passwordConfirmation;
	
	private int age;

	private String imageUrl;
	
	private UserGender gender; 
	
}
