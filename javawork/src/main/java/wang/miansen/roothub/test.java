package wang.miansen.roothub;

import static org.junit.Assert.*;

import java.security.MessageDigest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.springframework.util.Base64Utils;
import org.springframework.util.DigestUtils;

import wang.miansen.roothub.common.util.bcrypt.BCryptPasswordEncoder;

public class test {

	@Test
	public void test() {
		String hashAlgorithmName = "MD5";
		Object credentials = "123456";
		Object salt = ByteSource.Util.bytes("管理员");;
		int hashIterations = 1024;
		Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		System.out.println(result);
	}

}
