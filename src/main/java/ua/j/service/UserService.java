package ua.j.service;

import java.util.List;

import ua.j.entity.User;


public interface UserService {

	void saveUser(User user);
	
	User findUserById(int id);
	
	User findUserByEmail(String email);
	
	List<User> findAllUsers();
	
	void updateUser(User user);
	
	void deleteUserById(int id);

}
