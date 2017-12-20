package com.qf.util.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.qf.util.PageData;

/**
 * description：分页page类
 * author：郭桦
 * date: 2015.6.1
 */
@SuppressWarnings("all")
public class Page {

	private int pageNo = 1; // 当前第几页，初始值为1，小于pageCount
	private int pageSize = 10; // 每页显示条数
	private int pageCount; // 总页数
	private int rowCount; // 记录总数
	
	
    private int startRow;  
    private int endRow;  
    private List result;  
	private PageData pd = new PageData();//一页数据
    /**
	 * 计算起止行数
	 */
	public void newPage() {
		this.pageNo = pageNo;  
        this.pageSize = pageSize;  
        this.startRow = pageNo > 0 ? (pageNo - 1) * pageSize : 0;  
        this.endRow = pageSize;  
	}
    
    public Page(int pageNo, int pageSize) {  
        this.pageNo = pageNo;  
        this.pageSize = pageSize;  
        this.startRow = pageNo > 0 ? (pageNo - 1) * pageSize : 0;  
        this.endRow = pageSize;  
    }  
    public Page() {  
    	this.pageNo = pageNo;  
        this.pageSize = pageSize;  
        this.startRow = pageNo > 0 ? (pageNo - 1) * pageSize : 0;  
        this.endRow = pageSize;  
    }
    public List getResult() {  
        return result;  
    }  

	public void setResult(List result) {  
        this.result = result;  
    }  


    public int getEndRow() {  
        return endRow;  
    }  

    public void setEndRow(int endRow) {  
        this.endRow = endRow;  
    }  


    public int getStartRow() {  
        return startRow;  
    }  

    public void setStartRow(int startRow) {  
        this.startRow = startRow;  
    }  

    @Override
	public String toString() {
		return "Page [pageNo="
				+ pageNo + ", pageSize=" + pageSize + ", pageCount="
				+ pageCount + ", rowCount=" + rowCount + "]";
	}
	public int getPageNo() {
		if(this.pageNo>=this.pageCount){
			this.pageNo=this.pageCount;
		}
        if(this.pageNo < 1){
			this.pageNo =1;
		}
		return this.pageNo;
	}
	public void setPageNo(int pageNo) {		
        if(pageNo>=pageCount){
			pageNo=pageCount;
		}
        if(pageNo < 1){
			pageNo =1;
		}
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public PageData getPd() {
		return pd;
	}

	public void setPd(PageData pd) {
		this.pd = pd;
	}
	
}
