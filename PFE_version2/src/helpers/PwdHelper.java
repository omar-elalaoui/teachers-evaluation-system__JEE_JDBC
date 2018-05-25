package helpers;

import java.security.MessageDigest;
import Decoder.BASE64Encoder;

public class PwdHelper {
	
	public static String encrypt(String pass) {
		MessageDigest md = null;

		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(pass.getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		byte raw[] = md.digest();
		String hash = (new BASE64Encoder()).encode(raw);
		return hash;
	}
}
