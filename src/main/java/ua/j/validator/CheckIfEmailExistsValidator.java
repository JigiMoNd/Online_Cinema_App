package ua.j.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ua.j.repository.UserRepository;

@Component
public class CheckIfEmailExistsValidator implements ConstraintValidator<CheckIfEmailExists, String>{

	@Autowired 
	private UserRepository userRepository;

	@Override
	public boolean isValid(String email, ConstraintValidatorContext arg1) {
		if(userRepository.findUserByEmail(email) != null) {
			return false;
		} else {
			return true;
		}
	}
}
