package ua.j.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.j.entity.Actor;
import ua.j.entity.User;
import ua.j.entity.enums.UserRole;
import ua.j.service.ActorService;
import ua.j.service.UserService;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/api")
public class RestController {

	@Autowired 
	private UserService userService;
	@Autowired
	private ActorService actorService;
	
	@GetMapping("/list/users")
	public List<User> showUser() {
		return userService.findAllUsers();
	}
	
	@GetMapping("/delete/{userId}")
	public ResponseEntity<?> deleteUser(@PathVariable("userId") int userId) {
		userService.deleteUserById(userId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}	

	@GetMapping("/change-to-user/{userId}")
	public ResponseEntity<?> changeRoleUser(@PathVariable("userId") int userId) {
		User user = userService.findUserById(userId);
		user.setRole(UserRole.ROLE_USER);

		userService.updateUser(user);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@GetMapping("/change-to-admin/{userId}")
	public ResponseEntity<?> changeRoleAdmin(@PathVariable("userId") int userId) {
		User user = userService.findUserById(userId);
		user.setRole(UserRole.ROLE_ADMIN);

		userService.updateUser(user);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@GetMapping("/change-to-moderator/{userId}")
	public ResponseEntity<?> changeRoleModerator(@PathVariable("userId") int userId) {
		User user = userService.findUserById(userId);
		user.setRole(UserRole.ROLE_MODERATOR);
		
		userService.updateUser(user);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
//	
//	@GetMapping("/list/actors")
//	public List<Actor> showActor() {
//		return actorService.findAllActors();
//	}
	
}
