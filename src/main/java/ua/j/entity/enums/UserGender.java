package ua.j.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum UserGender {

	ROLE_MALE("MALE"), ROLE_FEMALE("FEMALE");
	
	private String gender;
	
}
