package com.billing.app.config;


import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.billing.app.dao.BillDao;
import com.billing.app.dao.BillDaoImp;
import com.billing.app.dao.ProductDao;
import com.billing.app.dao.ProductDaoImp;

@Configuration
@ComponentScan(basePackages="com.billing.app")
public class MvcConfig{
	public MvcConfig() {
		
	}
	 @Bean
	    public ViewResolver getViewResolver(){
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        resolver.setPrefix("/WEB-INF/views/");
	        resolver.setSuffix(".jsp");
	        return resolver;
	    }
	     
	 
	    @Bean
	    public DataSource getDataSource() {
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
	        dataSource.setUrl("jdbc:mysql://localhost:3306/product");
	        dataSource.setUsername("root");
	        dataSource.setPassword("aswinbabu125@");
	         
	        return dataSource;
	    }
	   
	     
	    @Bean
	    public ProductDao getProductDAO() {
	        return new ProductDaoImp(getDataSource());
	    }
	    
	    @Bean
	    public BillDao getBillDao() {
	    	return new BillDaoImp(getDataSource());
	    }
}
