package com.qf.util.common;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;




/**
*
* 项目名称：qf
* 类名称：DateUtil
* 类描述： 时间处理
* 创建人：周广文
* 创建时间：2015年5月13日 上午11:15:46
* 修改人：周广文
* 修改时间：2015年5月13日 上午11:15:46
* 修改备注：
* @version
*
*/
public class DateUtil {
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");

	private final static SimpleDateFormat sdfDay = new SimpleDateFormat(
			"yyyy-MM-dd");
	
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat(
	"yyyyMMdd");

	private final static SimpleDateFormat sdfTime = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	private final static SimpleDateFormat sdfYear_Month = new SimpleDateFormat(
			"yyyy-MM");
	/**
	 * 获取YYYY格式
	 * 
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * 
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * 
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * 
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}

	//获取当前时间的  年-月
	public static String getYear_month() {
		return sdfYear_Month.format(new Date());
	}
	/**
	* @Title: compareDate
	* @Description: TODO(日期比较，如果s>=e 返回true 否则返回false)
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author luguosui
	 */
	public static boolean compareDate(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() >=fomatDate(e).getTime();
	}

	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static Date fomatDate(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 校验日期是否合法
	 * 
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			long aa=0;
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	  /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date beginDate = null;
        java.util.Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
            // 
      
        return day;
    }
    
    /**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        
        return dateStr;
    }
    
    
    
    /**
    * getTimestamp(时间转化成时间戳)
    * @param @return 设定文件
    * @return String DOM对象
    * @Exception 异常对象
    * @since  CodingExample　Ver(编码范例查看) 1.1
    */
    public static long getTimestamp(String date) throws ParseException{
        Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        Date date2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse("1970/01/01 08:00:00");
        long l = date1.getTime() - date2.getTime() > 0 ? date1.getTime()- date2.getTime() : date2.getTime() - date1.getTime();
        //long rand = (int)(Math.random()*1000);

        //return rand;

        return l;
    }
    
    public static long getTimestamp2(String date) throws ParseException{
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
        Date date1=simpleDateFormat.parse(date);
        long timeStemp = date1.getTime()/1000;
        System.out.println(timeStemp );
        return timeStemp;
    }
    /**
     * 得到n天之后的月份
     * @param days
     * @return
     */
    public static int getAfterDayMonth(int daysInt) {
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("MM");
        String dateStr = sdfd.format(date);
        
        return Integer.parseInt(dateStr);
    }
    /**
     * 得到n天之后的 日期
     * @param days
     * @return
     */
    public static int getAfterDayNum(int daysInt) {
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("dd");
        String dateStr = sdfd.format(date);
        
        return Integer.parseInt(dateStr);
    }
    
 // 时间戳转日期
 	public static String fromTimestampToDate(Long time) {
 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 		String date = sdf.format(new Date(time * 1000));
 		return date;
 	}
 	
	 // 时间戳转日期
	public static String fromTimestampToDate2(Long time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date(time * 1000));
		return date;
	}
	
	 // 时间戳转日期
	public static String fromTimestampToDateMail(Long time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new Date(time * 1000));
		return date;
	}
	/**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate2(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    // 时间戳转日期到秒
 	public static String fromTimestampToDateSS(Long time) {
 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		String date = sdf.format(new Date(time * 1000));
 		return date;
 	}
 	
  //获得当天0点时间 
    public static long getTimesmorning(){ 
	    Calendar cal = Calendar.getInstance(); 
	    cal.set(Calendar.HOUR_OF_DAY, 0); 
	    cal.set(Calendar.SECOND, 0); 
	    cal.set(Calendar.MINUTE, 0); 
	    cal.set(Calendar.MILLISECOND, 0); 
	    return (long) (cal.getTimeInMillis()/1000); 
    } 
    //获取当月的起始时间
    public static long getTimestampMM(String date) throws ParseException{
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM");
        Date date1=simpleDateFormat.parse(date);
        long timeStemp = date1.getTime()/1000;
        return timeStemp;
    }
    
    //获取当月的天数
    public static int getDaysByMM(String strDate) throws ParseException{
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM"); 
    	Calendar calendar = new GregorianCalendar(); 
    	Date date = sdf.parse(strDate); 
    	calendar.setTime(date); 
    	return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }  
    
    public static List<String> getMonthBetween(String minDate, String maxDate) throws ParseException {
    	
        ArrayList<String> result = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");//格式化为年月

        Calendar min = Calendar.getInstance();
        Calendar max = Calendar.getInstance();

        min.setTime(sdf.parse(minDate));
        min.set(min.get(Calendar.YEAR), min.get(Calendar.MONTH), 0);

        max.setTime(sdf.parse(maxDate));
        max.set(max.get(Calendar.YEAR), max.get(Calendar.MONTH), 0);

        Calendar curr = max;
        while (curr.after(min)) {
	        result.add(sdf.format(curr.getTime()));
	       // System.out.println(sdf.format(curr.getTime()));
	        curr.add(Calendar.MONTH, -1);
        }
        return result;
      }  
    
    //列出当月日期
    public static List<Date> getAllTheDateOftheMonth(String date) throws ParseException{
    	
    	List<Date> list = new ArrayList<Date>();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(sdf.parse(date));
    	cal.set(Calendar.DATE, 1);

    	int month = cal.get(Calendar.MONTH);
    	while(cal.get(Calendar.MONTH) == month){
	    	list.add(cal.getTime());
	    	cal.add(Calendar.DATE, 1);
    	}
    	return list;
   }



     public static void main(String[] args) throws ParseException {
		//System.out.println(DateUtil.getYear_month());
    	// System.out.println(DateUtil.getDaysByMM("2016-02"));
    	 //DateUtil.getMonthBetween("2016-03", "2016-03");
    	 List<Date> list = getAllTheDateOftheMonth("2016-03");
    	 for(Date date: list){
    		try {
//				System.out.println(date.after(new Date()));
//				System.out.println(date.getDate());
//				System.out.println(date.getDay());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	 }
    	 //System.out.println(fromTimestampToDateSign(Long.parseLong("1453691017")));
    	 //System.out.println(getPrescribedMonth("2016-03",-1));
//    	  String t1="2016-12";
//    	  String t2="2017-03";
//    	  int result = t1.compareTo(t2);
//    	  System.out.println(result);
	}
     
	 // 时间戳转日期(签到)
	public static String fromTimestampToDateSign(Long time) {
		SimpleDateFormat sdf = new SimpleDateFormat("ddHH:mm");
		String date = sdf.format(new Date(time * 1000));
		return date;
	}
	//获取指定月份
	public static String getPrescribedMonth(String date,int i)throws ParseException{
		
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(sdf.parse(date));
        cal.add(Calendar.MONTH, i);       
        return sdf.format(cal.getTime());
    } 
}
