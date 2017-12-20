package com.qf.${packageName}.${objectNameLower}.dao;

import java.util.List;
import com.qf.${packageName}.${objectNameLower}.model.${objectName};
import com.qf.util.PageData;

public interface ${objectName}Mapper{

   int save(PageData pd);
   int delete(PageData pd);
   int edit(PageData pd);
   List<PageData> datalistPage(PageData pd);
   ${objectName} findById(PageData pd);
   void deleteAll(String[] ArrayDATA_IDS);
}