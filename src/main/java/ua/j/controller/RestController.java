package ua.j.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.j.entity.User;
import ua.j.service.UserService;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/api")
public class RestController {

	@Autowired 
	private UserService userService;
	
	@GetMapping("/list/users")
	public List<User> showUser() {
		return userService.findAllUsers();
	}
	
	@GetMapping("/delete/{userId}")
	public ResponseEntity<?> deleteUser(@PathVariable("userId") int userId) {
		userService.deleteUserById(userId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}	
	
	@GetMapping("/change-role/{userId}")
	public ResponseEntity<?> changeUserRole(@PathVariable("userId") int userId) {
		User user = userService.findUserById(userId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
