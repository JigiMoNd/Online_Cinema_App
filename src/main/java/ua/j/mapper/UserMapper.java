package ua.j.mapper;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import ua.j.domain.RegistrationRequest;
import ua.j.entity.enums.UserRole;

public interface UserMapper {

	public static User toSecurityUser(ua.j.entity.User user) {
		return new User(
				user.getId().toString(), 
				user.getPassword(), 
				AuthorityUtils.createAuthorityList(String.valueOf(user.getRole())));
		
		
	}
	
	public static ua.j.entity.User RegistrationRequestToUser(RegistrationRequest request) {
		ua.j.entity.User user = new ua.j.entity.User();
		user.setEmail(request.getEmail());
		user.setLastName(request.getLastName());
		user.setFirstName(request.getFirstName());
		user.setPassword(request.getPassword());
		user.setRole(UserRole.ROLE_USER);
		user.setAge(request.getAge());
		user.setGender(request.getGender());
		
		return user;
	}
	
	
}
