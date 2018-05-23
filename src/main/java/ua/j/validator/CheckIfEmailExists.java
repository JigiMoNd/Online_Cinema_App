package ua.j.validator;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Retention(RUNTIME)
@Target({ FIELD, METHOD })
@Constraint(validatedBy = CheckIfEmailExistsValidator.class)
public @interface CheckIfEmailExists {

	String message() default "Typed email is already using";
	Class<?>[] groups() default{};
	Class<? extends Payload>[] payload() default{};
	
}
