package com.qf.${packageName}.${objectNameLower}.service;


import com.qf.${packageName}.${objectNameLower}.model.${objectName};
import com.qf.util.page.Page;
import java.util.List;
import java.util.Map;
import com.qf.util.PageData;
public interface ${objectName}Service {


     int save(PageData pd);
     int delete(PageData pd);
     int edit(PageData pd);
     Map<String,Object> list(Page page, PageData pd);
     ${objectName} findById(PageData pd);
     void deleteAll(String [] ArrayDATA_IDS);

}
