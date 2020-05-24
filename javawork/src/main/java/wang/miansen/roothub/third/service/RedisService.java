package wang.miansen.roothub.third.service;

import java.util.Arrays;
import java.util.List;

import wang.miansen.roothub.modules.sys.model.SystemConfig;
import wang.miansen.roothub.modules.sys.service.SystemConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * <p>
 * Redis 配置与获取
 * </p>
 * 
 * @author: miansen.wang
 * @date: 2019-03-10
 */
@Component
public class RedisService {

	private Logger log = LoggerFactory.getLogger(RedisService.class);

	@Autowired
	private JedisPoolConfig jedisPoolConfig;
	@Autowired
	private JedisConnectionFactory jedisConnectionFactory;

	private static JedisPool jedisPool = null;

	/**
	 * 获取RedisPool实例
	 * 
	 * @return RedisPool实例
	 */
	public JedisPool getJedisPoolInstance() {
		try {
			if (jedisPool != null) {
				return jedisPool;
			}
			JedisPoolConfig poolConfig = new JedisPoolConfig();
			poolConfig.setMaxTotal(jedisPoolConfig.getMaxTotal()); // 最大连接数
			poolConfig.setMaxIdle(jedisPoolConfig.getMaxIdle()); // 最大空闲连接数
			poolConfig.setMaxWaitMillis(jedisPoolConfig.getMaxWaitMillis()); // 最大等待时间
			poolConfig.setTestOnBorrow(true); // 检查连接可用性, 确保获取的redis实例可用
			jedisPool = new JedisPool(poolConfig, jedisConnectionFactory.getHostName(),
					jedisConnectionFactory.getPort(), jedisConnectionFactory.getTimeout(),
					jedisConnectionFactory.getPassword());
			return jedisPool;
		} catch (Exception e) {
			log.error("配置redis连接池报错，错误信息: {}", e.getMessage());
			return null;
		}

	}

	/**
	 * 获取Jedis客户端
	 * 
	 * @return
	 */
	public Jedis getJedisInstance() {
		try {
			log.info("redis连接获取成功...");
			return getJedisPoolInstance().getResource();
		} catch (Exception e) {
			log.error("redis获取失败: {}", e.getMessage());
			return null;
		}
	}

	/**
	 * 将Jedis对象（连接）归还连接池
	 * 
	 * @param jedisPool 连接池
	 * @param jedis     连接对象
	 */
	public void release(JedisPool jedisPool, Jedis jedis) {
		if (jedis != null) {
			jedis.close();
		}
	}

	/**
	 * 获取String值
	 * 
	 * @param key
	 * @return
	 */
	public String getString(String key) {
		Jedis jedis = getJedisInstance();
		try {
			if (StringUtils.isEmpty(key) || jedis == null)
				return null;
			String value = jedis.get(key);
			return value;
		} finally {
			release(jedisPool, jedis);
		}
	}

	/**
	 * 设置string附带过期时间
	 * 
	 * @param key
	 * @param seconds
	 * @param value
	 */
	public void setStringWithTime(String key, int seconds, String value) {
		Jedis jedis = getJedisInstance();
		try {
			if (StringUtils.isEmpty(key) || StringUtils.isEmpty(value) || jedis == null)
				return;
			jedis.setex(key, seconds, value);
		} finally {
			release(jedisPool, jedis);
		}
	}

	/**
	 * 设置string
	 * 
	 * @param key
	 * @param seconds
	 * @param value
	 */
	public void setString(String key, String value) {
		Jedis jedis = getJedisInstance();
		try {
			if (StringUtils.isEmpty(key) || StringUtils.isEmpty(value) || jedis == null)
				return;
			jedis.set(key, value);
		} finally {
			release(jedisPool, jedis);
		}
	}

	/**
	 * 删除String值
	 * 
	 * @param key
	 */
	public void delString(String key) {
		Jedis jedis = getJedisInstance();
		try {
			if (StringUtils.isEmpty(key) || jedis == null)
				return;
			jedis.del(key);
		} finally {
			release(jedisPool, jedis);
		}
	}

	/**
	 * 判断key是否存在
	 *
	 * @param key
	 * @return
	 */
	public Boolean exists(String key) {
		Jedis jedis = getJedisInstance();
		try {
			return jedis.exists(key);
		} finally {
			release(jedisPool, jedis);
		}
	}

}
