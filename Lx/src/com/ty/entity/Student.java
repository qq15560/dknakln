package com.ty.entity;

public class Student {
 private int stuid;
 private String stuname;
 private String stuage;
 private String stusex;
 private String stuphone;
 private String stuaddres;
 private Classes classes;
@Override
public String toString() {
	return "Student [stuid=" + stuid + ", stuname=" + stuname + ", stuage=" + stuage + ", stusex=" + stusex
			+ ", stuphone=" + stuphone + ", stuaddres=" + stuaddres + ", classes=" + classes + "]";
}
public Classes getClasses() {
	return classes;
}
public void setClasses(Classes classes) {
	this.classes = classes;
}
public int getStuid() {
	return stuid;
}
public void setStuid(int stuid) {
	this.stuid = stuid;
}
public String getStuname() {
	return stuname;
}
public void setStuname(String stuname) {
	this.stuname = stuname;
}
public String getStuage() {
	return stuage;
}
public void setStuage(String stuage) {
	this.stuage = stuage;
}
public String getStusex() {
	return stusex;
}
public void setStusex(String stusex) {
	this.stusex = stusex;
}
public String getStuphone() {
	return stuphone;
}
public void setStuphone(String stuphone) {
	this.stuphone = stuphone;
}
public String getStuaddres() {
	return stuaddres;
}
public void setStuaddres(String stuaddres) {
	this.stuaddres = stuaddres;
}
public Student(int stuid, String stuname, String stuage, String stusex, String stuphone, String stuaddres) {
	super();
	this.stuid = stuid;
	this.stuname = stuname;
	this.stuage = stuage;
	this.stusex = stusex;
	this.stuphone = stuphone;
	this.stuaddres = stuaddres;
}
public Student() {
	super();
	// TODO Auto-generated constructor stub
}

}
