package ua.j.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import ua.j.entity.User;
import ua.j.repository.UserRepository;
import ua.j.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private UserRepository userRepository;

	private PasswordEncoder passwordEncoder;

	@Autowired
	public UserServiceImpl(UserRepository userRepository, PasswordEncoder passwordEncoder) {
		super();
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public void saveUser(User user) {
		String password = user.getPassword();
		user.setPassword(passwordEncoder.encode(password));
		userRepository.save(user);
	}

	@Override
	public User findUserById(int id) {
		return userRepository.getOne(id);
	}

	@Override
	public User findUserByEmail(String email) {
		return userRepository.findUserByEmail(email);
	}

	@Override
	public List<User> findAllUsers() {
		return userRepository.findAll();
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		userRepository.save(user);
	}
	@Override
	public void deleteUserById(int id) {
		userRepository.deleteById(id);
	}
}
