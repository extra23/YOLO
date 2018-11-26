package yolo.dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import junit.framework.TestCase;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/resources/config/applicationContext.xml")
public class UserDAOTest extends TestCase {
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private InterfaceUserDAO userDAO;////
	
	@Test @Ignore
	public void dbConnTest() {
		DataSource dataSource = (DataSource)context.getBean("dataSource");
		try {
			System.out.println(dataSource.getConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test 
	public void seletUserTest() {
		System.out.println(userDAO.selectUser(1));
	}

}