package com.qf.util.JsonDeserialize;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import sun.misc.BASE64Encoder;

public class String2Base64Deserializer extends JsonDeserializer<String> {

	private static Logger logger = LoggerFactory.getLogger(String2Base64Deserializer.class);
	@Override
	public String deserialize(JsonParser jp, DeserializationContext arg1)
			throws IOException, JsonProcessingException {
		try {
			return new BASE64Encoder().encode(jp.getText().getBytes("UTF-8"));
		} catch (Exception e) {
			logger.error("String2Base64Deserializer.deserialize occurs error, e = {}", e);
		}
		return jp.getText();
	}

}
