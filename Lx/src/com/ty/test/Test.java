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
	//����ʵ�����
	/*Student stu=dao.queryByName("%��%");
	System.out.println(stu.getStuname());*/
	
	//ʵ�弯��
	/*List<Student> list=dao.queryAll();
	for (Student student : list) {
		System.out.println("ѧ�����"+student.getStuid()+"ѧ����"+student.getStuname());
	}*/
	
	
	
	//��������
	/*String stu=dao.queryName(2);
	System.out.println(stu);
	*/
	
	//map����
	/*List<Map<String, Object>> map=dao.queryAll2();
	System.out.println(map);
	for (Map<String, Object> map2 : map) {
		Object o=map2.get("sanme");
		System.out.println(o);
	}*/
	
	//	Ƕ�ײ�ѯ1
	List<Student> list=dao.queryStudent2();
	System.out.println(list);
	for (Student student : list) {
		System.out.println("ѧ�����"+student.getStuid()+"ѧ������"+student.getStuname()+"ѧ����ַ"+student.getStuaddres());
	}
	
	
}
}
