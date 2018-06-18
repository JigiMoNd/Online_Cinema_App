package ua.j.validator;

import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Retention(RUNTIME)
@Target(TYPE)
@Constraint(validatedBy = CheckPasswordMatchValidator.class)
public @interface CheckPasswordMatch {

	String message() default "Typed password not match";
	Class<?>[] groups() default{};
	Class<? extends Payload>[] payload() default{};
	
	
}
