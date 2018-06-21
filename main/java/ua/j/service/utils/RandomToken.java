package ua.j.service.utils;

import org.apache.commons.lang.RandomStringUtils;

public class RandomToken {
	
	public static String generateToken() {
		return RandomStringUtils.randomAlphanumeric(50);
	}
}
