package com.qf.util;

import java.util.Map;

import com.qf.util.common.CallUrlUtil;
import com.qf.util.common.JackJson;

/**
 * QQ互联API
 * 
 * <pre>
 * 登录流程：
 * 
 * 1 前端跳转qq授权页面
 * 2 js获得access_token
 * 3 通过jsonp方式获得openid
 * 4 server端根据上传的access_token及openid获取用户信息，如昵称、头像
 * 
 * 参考文档：
 * http://wiki.connect.qq.com/%E5%BC%80%E5%8F%91%E6%94%BB%E7%95%A5_client-side#Step2.EF.BC.9A.E8.8E.B7.E5.8F.96AccessToken
 * </pre>
 * 
 * @author xxx
 * @createDate 2015年3月10日
 * 
 */
public class QQApi {

    public static String appId = "101282319";
    public static String appSecret = "842b9135d1742f8222215a6ba94ed608";

    public static String baseUrl = "https://graph.qq.com";

    protected static final String URL_GET_USERINFO = baseUrl
            + "/user/get_user_info?access_token=%s&oauth_consumer_key=%s&openid=%s";

    protected static final long ACCESS_TIMEOUT = 15;

    protected static final String DEF_APP_TOKEN_EXPIRE = "3h";

    /**
     * 获取用户信息
     * 
     * <pre>
     * http://wiki.connect.qq.com/get_user_info
     * 
     * 
     * 调用地址：
     * https://graph.qq.com/user/get_user_info
     * 参数
     *   access_token=*************&
     *   oauth_consumer_key=12345&
     *   openid
     * 
     * 返回结果如下：
     * {
     *     "ret": 0,
     *     "msg": "",
     *     "is_lost": 0,
     *     "nickname": "小吞",
     *     "gender": "女",
     *     "province": "广东",
     *     "city": "广州",
     *     "year": "1993",
     *     "figureurl": "http://qzapp.qlogo.cn/qzapp/101207268/982C9FEADAF7B242C5069B8F390784BF/30",
     *     "figureurl_1": "http://qzapp.qlogo.cn/qzapp/101207268/982C9FEADAF7B242C5069B8F390784BF/50",
     *     "figureurl_2": "http://qzapp.qlogo.cn/qzapp/101207268/982C9FEADAF7B242C5069B8F390784BF/100",
     *     "figureurl_qq_1": "http://q.qlogo.cn/qqapp/101207268/982C9FEADAF7B242C5069B8F390784BF/40",
     *     "figureurl_qq_2": "http://q.qlogo.cn/qqapp/101207268/982C9FEADAF7B242C5069B8F390784BF/100",
     *     "is_yellow_vip": "0",
     *     "vip": "0",
     *     "yellow_vip_level": "0",
     *     "level": "0",
     *     "is_yellow_year_vip": "0"
     * }
     * </pre>
     * 
     * @param accessToken
     * @return
     */
    public static Map getUserInfo(String accessToken, String openid) {
        if (accessToken==null || "".equals(accessToken) || openid==null || "".equals(openid)) {
            return null;
        }
        String url = String.format(URL_GET_USERINFO, accessToken, appId, openid);
        String resultString = CallUrlUtil.callUrlByGet2(url);
        Map userinfo = JackJson.fromJsonToObject(resultString, Map.class);
        if (userinfo == null ) {
            return null;
        }
        return userinfo;
    }
}