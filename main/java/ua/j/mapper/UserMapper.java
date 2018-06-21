package ua.j.mapper;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import ua.j.domain.EditRequest;
import ua.j.domain.RegistrationRequest;
import ua.j.entity.enums.UserRole;

public interface UserMapper {

	public static User toSecurityUser(ua.j.entity.User user) {
		return new User(
				user.getId().toString(), 
				user.getPassword(), 
				AuthorityUtils.createAuthorityList(String.valueOf(user.getRole())));
		
		
	}
	
	public static ua.j.entity.User registrationRequestToUser(RegistrationRequest request) {
		ua.j.entity.User user = new ua.j.entity.User();
		user.setEmail(request.getEmail());
		user.setLastName(request.getLastName());
		user.setFirstName(request.getFirstName());
		user.setPassword(request.getPassword());
		user.setRole(UserRole.ROLE_UNCONFIRMED);
		user.setAge(request.getAge());
		user.setGender(request.getGender());
		user.setImageUrl(request.getImageUrl());
		
		return user;
	}
	
	public static EditRequest userToEditRequest(ua.j.entity.User user) {
		EditRequest request = new EditRequest();
		request.setEmail(user.getEmail());
		request.setLastName(user.getLastName());
		request.setFirstName(user.getFirstName());
		request.setPassword(user.getPassword());
		request.setRole(user.getRole());
		request.setAge(user.getAge());
		request.setGender(user.getGender());
		request.setId(user.getId());
//		request.setCreatedAt(user.getCreatedAt());
		request.setImageUrl(user.getImageUrl());
		
		return request;
	}
	
	public static ua.j.entity.User editRequestToUser(EditRequest request) {
		ua.j.entity.User user = new ua.j.entity.User();
		user.setEmail(request.getEmail());
		user.setLastName(request.getLastName());
		user.setFirstName(request.getFirstName());
		user.setPassword(request.getPassword());
		user.setRole(request.getRole());
		user.setAge(request.getAge());
		user.setGender(request.getGender());
		user.setId(request.getId());
//		user.setCreatedAt(request.getCreatedAt());
		user.setImageUrl(request.getImageUrl());
		
		return user;
	}
	
}
