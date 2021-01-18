package com.joy.simple;

import java.security.NoSuchAlgorithmException;


import com.joy.service.UserSha256;

public class PasswordSecurity {
	public static void main(String[] args) throws NoSuchAlgorithmException {
		String raw = "1111";
		String end = UserSha256.encrypt(raw);
		System.out.println(end);
	}
}
