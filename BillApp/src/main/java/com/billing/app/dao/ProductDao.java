package com.billing.app.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.billing.app.model.Product;
 
@Component
public interface ProductDao{
     
    public Boolean saveProduct(Product pro);
    
    public Boolean updateProduct(Product pro,String oldcode);
     
    public void delete(String pcode);
     
    public Product get(String pcode);
     
    public Product getByName(String pname);
     
    public List<Product> list();
    
    public String getCode(String pname);
}