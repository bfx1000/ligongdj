package com.qf.util.JsonDeserialize;

import java.io.IOException;
import java.util.Date;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class Long2DateDeserializer extends JsonDeserializer<Date> {

//	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 

	@Override
	public Date deserialize(JsonParser jp, DeserializationContext arg1) throws IOException, JsonProcessingException {
		Date date = null;  
        try {  
            date = new Date(Long.valueOf(jp.getText()) * 1000);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return date; 
	}

}
