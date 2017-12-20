package com.qf.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
*
* 项目名称：qf
* 类名称：ContentFilter
* 类描述：敏感字符过滤器
* 创建人：周广文
* 创建时间：2015年5月16日 下午4:55:26
* 修改人：周广文
* 修改时间：2015年5月16日 下午4:55:26
* 修改备注：
* @version
*
*/
public class ContentFilter implements Filter {
    @Override
    public void init(FilterConfig config) throws ServletException {
        // TODO Auto-generated method stub
    }
 
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
 
        //思路：得到提交数据，替换，重新设置进去
        //使用包装对象来包裹原请求对象
        //如果是第一次请求，则加载关键字,缓存到ServletContext
        ContentReplaceHttpServletRequestWapper wapper=new ContentReplaceHttpServletRequestWapper(request);
        chain.doFilter(wapper, resp);
    }
 
    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }
}
