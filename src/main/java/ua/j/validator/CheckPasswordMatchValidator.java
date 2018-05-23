package ua.j.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.stereotype.Component;

import ua.j.domain.RegistrationRequest;

@Component
public class CheckPasswordMatchValidator 
	implements ConstraintValidator<CheckPasswordMatch, RegistrationRequest>{

	@Override
	public boolean isValid(RegistrationRequest regRequest, ConstraintValidatorContext arg1) {
		
		if(regRequest.getPassword() == null || regRequest.getPasswordConfirmation() == null) {
			return false;
		}
		
		if(regRequest.getPassword().equals(regRequest.getPasswordConfirmation())) {
			return true;
		}
		
		
		return false;
	}
	
	

}
