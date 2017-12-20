package com.qf.util.nodemodel;

/**
* 节点类
*/
public class ReadNode {

	public int menu_id;
	public String menu_name;
	public String menu_url;
	public int parent_id;
	public int menu_order;
	public int menu_type;
	public int user_type;
	public int ismenu;
	public int level;
	/**
	 * 孩子节点列表
	 */
	private Children children = new Children();
 
	// 先序遍历，拼接JSON字符串
	public String toString() {  
		Boolean ischeck = false;
		 if(ismenu == 1){
			 ischeck = true;
		 }
		String result = "{" + "id: " + menu_id + ", name : '" + menu_name + "', pId:'" + parent_id + "', level: " + level + ", checked: " + ischeck;
			  
		if (children != null && children.getSize() != 0) {
			result += ", children : " + children.toString();
		} else {
			result += ", leaf : true";
		}
		return result + "}";
	}
 
	// 兄弟节点横向排序
	public void sortChildren() {
		if (children != null && children.getSize() != 0) {
			children.sortChildren();
		}
	}
 
	// 添加孩子节点
	public void addChild(ReadNode downloadNode) {
		this.children.addChild(downloadNode);
	}
}
