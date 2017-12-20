package com.qf.util.nodemodel;

import java.util.Comparator;

/**
 * 节点比较器
 */
class NodeIDComparator implements Comparator {
 // 按照节点编号比较
 public int compare(Object o1, Object o2) {
  int j1 = ((ReadNode)o1).menu_id;
     int j2 = ((ReadNode)o2).menu_id;
     return (j1 < j2 ? -1 : (j1 == j2 ? 0 : 1));
 } 
}
