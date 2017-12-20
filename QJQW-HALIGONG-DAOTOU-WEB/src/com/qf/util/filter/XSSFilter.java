package com.qf.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
*
* 项目名称：qf
* 类名称：XSSFilter
* 类描述：敏感字符过滤器
* 创建人：周广文
* 创建时间：2015年5月16日 上午11:50:16
* 修改人：周广文
* 修改时间：2015年5月16日 上午11:50:16
* 修改备注：
* @version
*
*/
public class XSSFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void destroy() {
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {
        chain.doFilter(new XSSRequestWrapper((HttpServletRequest) request), response);
    }
}
