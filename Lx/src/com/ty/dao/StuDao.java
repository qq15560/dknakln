package com.ty.dao;

import java.util.List;
import java.util.Map;

import com.ty.entity.Student;

public interface StuDao {
public Student queryByName(String stuname);//���ص���ʵ�����
public List<Student> queryAll();//����ʵ�弯��
public String queryName(int id);//���ص������
public List<Map<String, Object>> queryAll2();//����map����
public List<Student> queryStudent2();

}
