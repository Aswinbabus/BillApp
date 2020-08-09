package com.billing.app.dao;

import java.util.List;

import com.billing.app.model.FinalProduct;


public interface BillDao {

	public void addProduct(String pcode,int quan);
	
	public List<FinalProduct> list();

	public void clearEntry();

	public void addQuantity(String qcode, int quan);

	public void removeProduct(String qcode);

	public FinalProduct get(String pcode);

	public Double getGrandTotal();
}
