package com.billing.app.dao;


	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.List;
	 
	import javax.sql.DataSource;
	import org.springframework.dao.DataAccessException;
	import org.springframework.jdbc.core.JdbcTemplate;
	import org.springframework.jdbc.core.ResultSetExtractor;
	import org.springframework.jdbc.core.RowMapper;

import com.billing.app.model.Product;

	public class ProductDaoImp implements ProductDao{
	  
	    private JdbcTemplate jdbcTemplate;
	 
	    public ProductDaoImp(DataSource dataSource) {
	        jdbcTemplate = new JdbcTemplate(dataSource);
	    }
	 
	    @Override
	    public Boolean saveProduct(Product product) {
	    	
	    	    	if(this.get(product.getPcode())==null && this.getByName(product.getPname()) == null) {
	    	        String sql = "INSERT INTO product (productCode,productName,productPrice,productGst)"
	    	                    + " VALUES (?, ?, ?, ?)";
	    	        jdbcTemplate.update(sql,  product.getPcode(),
	    	                product.getPname(), product.getPrice(), product.getGst());
	    	    	return true;
	    	    	}
	    	    	else {
	    	    		return false;
	    	    	}
	    }
	 public Boolean updateProduct(Product product,String oldCode) {
	   String name=product.getPname();
	 	product.setPcode(oldCode);
	 	String num=this.getCode(name);
	  if(num==null || num.equals(oldCode)){
	        String sql = "UPDATE product SET productCode = ? ,productName=?, productPrice=?, productGst=? "
	                    + "WHERE productCode=?";
	        jdbcTemplate.update(sql,product.getPcode(), product.getPname(),
	                product.getPrice(), product.getGst(), oldCode);
	        return true;
	    } 
	  else {
		  return false;
	  }
	 }
	    public void delete(String Pcode) {
	    	    String sql = "DELETE FROM product WHERE productCode=?";
	    	    jdbcTemplate.update(sql, Pcode);
	    	}

	 
	    @Override
	    public List<Product> list() {
	    	String sql = "SELECT * FROM product";
	        List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
	     
	           public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
	                Product aProduct = new Product();
	     
	              
	                aProduct.setPname(rs.getString("productName"));
	                aProduct.setPcode(rs.getString("productCode"));
	                aProduct.setPrice(rs.getDouble("productPrice"));
	                aProduct.setGst(rs.getDouble("productGst"));
	     
	                return aProduct;
	            }
	     
	        });
	     
	        return listProduct;
	    }
	 
	    @Override
	    public Product get(String Pcode) {
	    	 String sql = "SELECT * FROM product WHERE productCode='" + Pcode +"'";
	    	    return jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
	    	 
	    	        public Product extractData(ResultSet rs) throws SQLException,DataAccessException{
	    	            if (rs.next()) {
	    	                Product Pro = new Product();
	    	                Pro.setPname(rs.getString("productName"));
	    	                Pro.setPcode(rs.getString("productCode"));
	    	                Pro.setPrice(rs.getDouble("productPrice"));
	    	                Pro.setGst(rs.getDouble("productGst"));
	    	                return Pro;
	    	            }
	    	 
	    	            return null;
	    	        }
	    	 
	    	    });
	    }
	    
	    public Product getByName(String pname) {
	    	 String sql = "SELECT * FROM product WHERE productName='" + pname +"'";
	    	    return jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
	    	 
	    	        public Product extractData(ResultSet rs) throws SQLException,DataAccessException{
	    	            if (rs.next()) {
	    	                Product Pro = new Product();
	    	                Pro.setPname(rs.getString("productName"));
	    	                Pro.setPcode(rs.getString("productCode"));
	    	                Pro.setPrice(rs.getDouble("productPrice"));
	    	                Pro.setGst(rs.getDouble("productGst"));
	    	                return Pro;
	    	            }
	    	 
	    	            return null;
	    	        }
	    	 
	    	    });
	    }
       public String getCode(String pname) {
    	   String r="select productCode from product where productName='"+pname+"'";
    	   return jdbcTemplate.queryForObject(r,String.class);
       }

	 
	}
