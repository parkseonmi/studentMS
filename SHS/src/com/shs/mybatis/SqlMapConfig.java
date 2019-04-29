package com.shs.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/shs/mybatis/Configuration.xml";
		// Configuration: mybatis의 모든 환경설정 정보가 들어있음 -> resource변수에 담음
		
		try {
			
			// Resources.getResourceAsReader가 resource의 xml파일을 한줄씩 가져와 reader에 담음
			Reader reader = Resources.getResourceAsReader(resource);
			
			// 공장이 하나도 없을 경우
			if(sqlSessionFactory == null) {
				
				// SqlSessionFactoryBuilder: 공장을 만들어줌 / reader을 토대로 만들어라
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
