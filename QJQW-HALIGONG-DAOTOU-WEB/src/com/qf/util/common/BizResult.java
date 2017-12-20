package com.qf.util.common;

import java.util.List;

public class BizResult {

	public int nums = 0; // 操作数据库受影响行数
	public boolean result = true; // 操作成功或者失败
	public boolean outcome = true; //条件查询操作成功或者失败
	public String message = ""; // 成功或失败信息
	public String sql = ""; // 语句
	public List list;
	public List pagelist;
	public String pagefoot;
	public String pageCount;
	public String nowPage;

	//返回控制
	public String returntype = "";
	
	public String getReturntype() {
		return returntype;
	}

	public void setReturntype(String returntype) {
		this.returntype = returntype;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public List getPagelist() {
		return pagelist;
	}

	public void setPagelist(List pagelist) {
		this.pagelist = pagelist;
	}

	public String getPagefoot() {
		return pagefoot;
	}

	public void setPagefoot(String pagefoot) {
		this.pagefoot = pagefoot;
	}
	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public String getNowPage() {
		return nowPage;
	}

	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}

	public int getNums() {
		return nums;
	}

	public void setNums(int nums) {
		this.nums = nums;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setError(String message) {
		this.message = "<font color=\"#ff3300\">" + message + "</font>";
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public boolean isOutcome() {
		return outcome;
	}

	public void setOutcome(boolean outcome) {
		this.outcome = outcome;
	}

}
