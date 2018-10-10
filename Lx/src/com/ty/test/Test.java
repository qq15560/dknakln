package com.ty.test;		

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import com.ty.dao.StuDao;
import com.ty.entity.Student;
import com.ty.until.Factory;

public class Test {
 public static void main(String[] args) {
	SqlSession session=Factory.getsession();
	StuDao dao=session.getMapper(StuDao.class);
	//单个实体对象
	/*Student stu=dao.queryByName("%李%");
	System.out.println(stu.getStuname());*/
	
	//实体集合
	/*List<Student> list=dao.queryAll();
	for (Student student : list) {
		System.out.println("学生编号"+student.getStuid()+"学生名"+student.getStuname());
	}*/
	
	
	
	//单个参数
	/*String stu=dao.queryName(2);
	System.out.println(stu);
	*/
	
	//map集合
	/*List<Map<String, Object>> map=dao.queryAll2();
	System.out.println(map);
	for (Map<String, Object> map2 : map) {
		Object o=map2.get("sanme");
		System.out.println(o);
	}*/
	
	//	嵌套查询1
	List<Student> list=dao.queryStudent2();
	System.out.println(list);
	for (Student student : list) {
		System.out.println("学生编号"+student.getStuid()+"学生姓名"+student.getStuname()+"学生地址"+student.getStuaddres());
	}
	
	
}
}
