package com.qf.util;


import org.springframework.cache.Cache.ValueWrapper;
import org.springframework.cache.ehcache.EhCacheCacheManager;

/**
 * 过渡缓存util，之后建议切换成memcache或rides
 * @author hanjiaqi
 *
 */
@Deprecated
public class EhcacheUtil {

	private EhcacheUtil() {
		
	}

	public static boolean setObject2Cache(EhCacheCacheManager cacheManager, String key, Object value, String cacheName) {

        boolean result = false;
        try {
        	cacheManager.getCache(cacheName).put(key, value);
        	result = true;
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        return result;
	}

	public static Object getObjectFromCache(EhCacheCacheManager cacheManager, String key, String cacheName) {
		ValueWrapper value = cacheManager.getCache(cacheName).get(key);
		return value == null ? null : value.get();
	}
}
