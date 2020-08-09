package com.billing.app.model;
public class Product {
	    private String pname;
	    private String pcode;
	    private Double price;
	    private Double gst;
		public Product(String pname, String pcode, Double price, Double gst) {
			this.pname = pname;
			this.pcode = pcode;
			this.price = price;
			this.gst = gst;
		}
		public Product(){
			
		}
		public String getPname() {
			return pname;
		}
		public void setPname(String pname) {
			this.pname = pname;
		}
		public String getPcode() {
			return pcode;
		}
		public void setPcode(String pcode) {
			this.pcode = pcode;
		}
		public Double getPrice() {
			return price;
		}
		public void setPrice(Double price) {
			this.price = Math.round(price*100.00)/100.00;
		}
		public Double getGst() {
			return gst;
		}
		public void setGst(Double gst) {
			this.gst = Math.round(gst*100.00)/100.00;
		}
		
	 
	    
}
