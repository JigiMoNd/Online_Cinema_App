package ua.j.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum UserRole {

	ROLE_ADMIN("ADMIN"), ROLE_USER("USER"), ROLE_MODERATOR("MODERATOR");
	
	private String role;
	
}
