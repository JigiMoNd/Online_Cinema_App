package ua.j.domain;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ua.j.entity.enums.UserGender;
import ua.j.entity.enums.UserRole;

@NoArgsConstructor
@Getter @Setter
public class EditRequest {

	private int id;
	
	private String email;

	private String password;

	@Enumerated(EnumType.ORDINAL)
	private UserRole role;
	
	private String firstName; 

	private String lastName; 

	private int age;

	private UserGender gender; 

	
}
