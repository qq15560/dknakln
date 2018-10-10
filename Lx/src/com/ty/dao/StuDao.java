package com.ty.dao;

import java.util.List;
import java.util.Map;

import com.ty.entity.Student;

public interface StuDao {
public Student queryByName(String stuname);//返回单个实体对象
public List<Student> queryAll();//返回实体集合
public String queryName(int id);//返回单个结果
public List<Map<String, Object>> queryAll2();//返回map集合
public List<Student> queryStudent2();

}
