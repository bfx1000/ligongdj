package com.qf.util.loger.service;

import javax.annotation.Resource;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.qf.util.loger.model.Log;

@Service("logService")
public class LogServiceImpl implements LogService {
	
    @Resource(name = "mongoTemplate")
    MongoTemplate mongoTemplate; 
    
    @Override
    public void add(Log log) {
    	// TODO Auto-generated method stub
    	mongoTemplate.insert(log,"loger");
    }
}
