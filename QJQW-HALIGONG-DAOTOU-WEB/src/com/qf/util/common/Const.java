package com.qf.util.common;



import org.bson.types.ObjectId;
import org.springframework.context.ApplicationContext;
/**
 * 项目名称：
 * @author:zhouguangwen
 * 
*/
public class Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	
	public static final String SESSION_menuList = "menuList";			//当前菜单
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	
	public static final String SESSION_QX = "QX";
	public static final String SESSION_userpds = "userpds";			
	public static final String SESSION_USER_FB ="FB";// 用户福币数
	public static final String SESSION_USERROL = "USERROL";				//用户对象
	public static final String SESSION_USERNAME = "USER_NAME";			//用户名
	
	
	public static final String SESSION_ADMIN="admin";
	
	
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/login_toLogin";				//登录地址
	public static final String SYSNAME = "admin00/head/SYSNAME.txt";	//系统名称路径
	public static final String PAGE	   = "10";		//分页条数配置路径
	public static final String EMAIL   = "admin00/head/EMAIL.txt";		//邮箱服务器配置路径
	public static final String SMS1   = "admin00/head/SMS1.txt";		//短信账户配置路径1
	public static final String SMS2   = "admin00/head/SMS2.txt";		//短信账户配置路径2
	public static final String NO_INTERCEPTOR_PATH = ".*/((login)|(logout)|(index)|(queryAgreementByIdForPdf)|(code)|(app)|(queryHomeListForGD)|(eb61f5097ea96a579a0c470752ef9bbb)|(websocket)).*";	//不对匹配该值的访问路径拦截（正则）
	

	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
	public static Object session_user_obid="user_obid";
	public static String SESSIONUSERID="sessionuserid";
	public static long delete_time =Long.parseLong("32472115200");
	//手机端分页条数
	public static int phone_page_limit = 20;
	// 水印位置（无、随机、左上、右上、居中、左下、右下）

	/**
	 * APP Constants
	 */
	//app注册接口_请求协议参数)
	public static final String[] APP_REGISTERED_PARAM_ARRAY = new String[]{"countries","uname","passwd","title","full_name","company_name","countries_code","area_code","telephone","mobile"};
	public static final String[] APP_REGISTERED_VALUE_ARRAY = new String[]{"国籍","邮箱帐号","密码","称谓","名称","公司名称","国家编号","区号","电话","手机号"};
	
	//app登录接口_请求协议中的参数
	public static final String[] APP_LOGIN_PARAM_ARRAY = new String[]{"uname","passwd"};
	public static final String[] APP_LOGIN_VALUE_ARRAY = new String[]{"邮箱账号","密码"};
	
	//app登录状态接口_请求协议中的参数
	public static final String[] APP_LOGINSTATUS_PARAM_ARRAY = new String[]{"app_id","status"};
	public static final String[] APP_LOGINSTATUS_VALUE_ARRAY = new String[]{"app登录用户ID","登录状态"};	
	
	//忘记密码,查找用户账户是否存在接口_请求协议中的参数
	public static final String[] APP_FORGOTPASSWORD_PARAM_ARRAY = new String[]{"uname"};
	public static final String[] APP_FORGOTPASSWORD_VALUE_ARRAY = new String[]{"邮箱账号"};
	
	public static final int FENYE   = 10;		//分页条数
	public static final String CONF = "qifu.properties"; 
	public static final String PROVINCE = "proList";
		//public static final String PAYURL = "http://192.168.1.122:8888/payment/PayRoute"; // 支付接口地址本机
		public static final String PAYURL = "http://www.qjqw.com:8080/PayRoute"; // 支付接口地址本机
		//public static final String PAYURLWAP = "http://192.168.1.122:8888/payment/PayRoutewap"; // 支付接口地址本机
		public static final String PAYURLWAP = "http://www.qjqw.com:8080/PayRoutewap"; // 支付接口地址本机
	public static final String SESSION_USERINFO = "user_info";
	public static final Object FOLIST = "fo_list"; //佛祖集合
	
    //用户vip对应消费折扣
	public static final double[] VipDiscount = new double[]{1,0.95,0.9,0.8,0.7,0.6,0.5,0.4};
	//用户vip等级对应积分
	public static final int[] VipIntegral = new int[]{0,5000,20000,50000,100000,200000,500000,1000000};


	//根据充值金额 计算相应福币  
	public static int getFbByRmb(int rmb){
		int fb = rmb*100;
		if(rmb>=50 && rmb<100){
			fb = rmb*100+500 ;
		}else if(rmb>=100 && rmb<200){
			fb = rmb*100+3000 ;
		}else if(rmb>=200 && rmb<300){
			fb = rmb*100+8000 ;
		}else if(rmb>=300 && rmb<500){
			fb = rmb*100+15000 ;
		}else if(rmb>=500 && rmb<1000){
			fb = rmb*100+35000 ;
		}else if(rmb>=1000){
			fb = rmb*100+100000 ;
		}
		return fb;
	}
	
	public static final String ADMIN_UID="51";
	public static final String ADMIN_OID = "566e3a43cb44cf1fb4083b80";
	public static final String ADMIN_NICK_NAME = "admin";
	public static final String ADMIN_HEAD_PHOTO = "/resources/images/default_head_photo.jpg"; 
	//后台管理员objId集合
	public static final ObjectId[] MANAGEROBJIDS = {new ObjectId("566fa441cb44cf034069066d"),new ObjectId("56724b4656c6e009f07ae71c")};
	//加好友积分
	public static final int JHYJF = 500;	
	//游览日志存储数量（墓园为单位）
	public static final int  CEMETERYFOOTSIZE = 50;
	//推广统计开始月份
	public static final String  STARTINCOMEDATE = "2016-02";
	
	//签到开始月份
	public static final String  SIGNSTARTDATE = "2007-01";
	
}
