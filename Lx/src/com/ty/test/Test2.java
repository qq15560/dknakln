package com.ty.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ty.dao.ClassesDao;
import com.ty.entity.Classes;
import com.ty.until.Factory;

public class Test2 {
	public static void main(String[] args) {
		 SqlSession session=Factory.getsession();
		 ClassesDao dao=session.getMapper(ClassesDao.class);
		 List<Classes> list=dao.queryClasses();
		 for (Classes classes : list) {
			System.out.println("班级编号:"+classes.getClassid()+"--班级名称:"+classes.getClassname());
			System.out.println("学生信息:"+classes.getStudent());
		}	
	}

}
