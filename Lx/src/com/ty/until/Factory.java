package com.ty.until;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Factory {
  private static SqlSessionFactory factory=null;//工厂
  private static SqlSession session=null;
  static{
	  String source="mybatis.xml";
	  try {
		Reader reader=Resources.getResourceAsReader(source);//加载读取器
		factory=new SqlSessionFactoryBuilder().build(reader);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }

  public static SqlSession getsession(){
	  session=factory.openSession();
	  return session;
  }
}
