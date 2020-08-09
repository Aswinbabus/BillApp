package com.billing.app.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.billing.app.model.Product;
import com.billing.app.model.FinalProduct;

public class BillDaoImp implements BillDao{
  @Autowired
  private ProductDao p;
  
  private JdbcTemplate jdbcTemplate;
	 
  public BillDaoImp(DataSource dataSource) {
      jdbcTemplate = new JdbcTemplate(dataSource);
  }
  
	public void addProduct(String pcode,int quan) {
		FinalProduct pab=this.get(pcode);
		if(pab!=null) {			
		this.addQuantity(pcode,pab.getQuantity()+quan);
		}
		else {
			Product product=p.get(pcode);
		 String sql = "INSERT INTO billtable(productCode,productName,productPrice,productGst,productQuantity,productTotal)"
                 + " VALUES (?, ?, ?, ?, ?,?)";
     jdbcTemplate.update(sql,  product.getPcode(),
             product.getPname(), product.getPrice(), product.getGst(),quan,(100+product.getGst())*(product.getPrice()*quan)/100);
		}
	}
	
	public List<FinalProduct> list(){
		String sql = "SELECT * FROM billtable";
        List<FinalProduct> listProduct = jdbcTemplate.query(sql, new RowMapper<FinalProduct>() {
     
           public FinalProduct mapRow(ResultSet rs, int rowNum) throws SQLException {
                FinalProduct aProduct = new FinalProduct();
     
              
                aProduct.setPname(rs.getString("productName"));
                aProduct.setPcode(rs.getString("productCode"));
                aProduct.setPrice(rs.getDouble("productPrice"));
                aProduct.setGst(rs.getDouble("productGst"));
                aProduct.setQuantity(rs.getInt("productQuantity"));
                aProduct.setTotal(rs.getDouble("productTotal"));
     
                return aProduct;
            }
     
        });
     
        return listProduct;
	}

	public void clearEntry() {
		String sql="TRUNCATE TABLE billtable";
		 jdbcTemplate.update(sql);	
	}

	@Override
	public void addQuantity(String qcode, int quan) {
		String sql="update billtable set productQuantity = ? ,productTotal=(100+productGst)*(productPrice*?)/100 where productCode=?";
		jdbcTemplate.update(sql,quan,quan,qcode);		
	}

	public void removeProduct(String qcode) {
		String sql="delete from billtable where productCode=?";
		jdbcTemplate.update(sql,qcode);
		System.out.println(qcode);
		
	}

    public FinalProduct get(String Pcode) {
   	 String sql = "SELECT * FROM billtable WHERE productCode='" + Pcode +"'";
   	    return jdbcTemplate.query(sql, new ResultSetExtractor<FinalProduct>() {
   	 
   	        public FinalProduct extractData(ResultSet rs) throws SQLException,DataAccessException{
   	            if (rs.next()) {
   	                FinalProduct Pro = new FinalProduct();
   	                Pro.setPname(rs.getString("productName"));
   	                Pro.setPcode(rs.getString("productCode"));
   	                Pro.setPrice(rs.getDouble("productPrice"));
   	                Pro.setGst(rs.getDouble("productGst"));
   	             Pro.setQuantity(rs.getInt("productQuantity"));
   	             Pro.setTotal(rs.getDouble("productTotal"));
   	                return Pro;
   	            }
   	 
   	            return null;
   	        }
   	 
   	    });
   }

	
	public Double getGrandTotal() {
		String sql="select sum(productTotal) from billtable";
		double gtot=Math.round(jdbcTemplate.queryForObject(sql,Double.class)*100.00)/100.00;
		return gtot;
	}
	 
}
