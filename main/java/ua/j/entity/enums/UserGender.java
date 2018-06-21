package ua.j.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum UserGender {

	ROLE_MALE("Male"), ROLE_FEMALE("Female");
	
	private String gender;
	
}
