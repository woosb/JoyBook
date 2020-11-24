package com.joy.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class MybatisTests {
	
	@Inject
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testFactory() {
		System.out.println(sqlSessionFactory);
	}
	
	@Test
	public void testSession() throws Exception{
		try {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			System.out.println(sqlSession);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}