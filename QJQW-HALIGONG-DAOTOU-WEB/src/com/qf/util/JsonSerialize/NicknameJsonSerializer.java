package com.qf.util.JsonSerialize;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import sun.misc.BASE64Decoder;

public class NicknameJsonSerializer extends JsonSerializer<String> {

	@Override
	public void serialize(String nickname, JsonGenerator jgen, SerializerProvider arg2)
			throws IOException, JsonProcessingException {
		
	     jgen.writeString(new String(new BASE64Decoder().decodeBuffer(nickname), "UTF-8"));  
	}

}
