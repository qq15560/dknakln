package com.ty.entity;

import java.util.List;

public class Classes {
 private int classid;
 private String classname;
 private List<Student> student;
 public Classes(int classid, String classname, List<Student> student) {
	super();
	this.classid = classid;
	this.classname = classname;
	this.student = student;
}
public String getClassname() {
	return classname;
}
public void setClassname(String classname) {
	this.classname = classname;
}
public List<Student> getStudent() {
	return student;
}
public void setStudent(List<Student> student) {
	this.student = student;
}
public int getClassid() {
	return classid;
}
public void setClassid(int classid) {
	this.classid = classid;
}
public Classes(int classid, String classname) {
	super();
	this.classid = classid;
	this.classname = classname;
}
public Classes() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "Classes [classid=" + classid + ", classname=" + classname + ", student=" + student + "]";
}

}
