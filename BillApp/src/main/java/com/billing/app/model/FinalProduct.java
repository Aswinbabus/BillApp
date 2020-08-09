package com.billing.app.model;

public class FinalProduct{

	   private String pname;
	    private String pcode;
	    private Double price;
	    private Double gst;
	    private Integer quantity;
	    private Double total;
		public FinalProduct(String pname, String pcode, Double price, Double gst, Integer quantity, Double total) {
			super();
			this.pname = pname;
			this.pcode = pcode;
			this.price = price;
			this.gst = gst;
			this.quantity = quantity;
			this.total = total;
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
			this.price = Math.round(price * 100.00)/100.00;
		}
		public Double getGst() {
			return gst;
		}
		public void setGst(Double gst) {
			this.gst = Math.round(gst * 100.00)/100.00;
		}
		public Integer getQuantity() {
			return quantity;
		}
		public void setQuantity(Integer quantity) {
			this.quantity = quantity;
		}
		public Double getTotal() {
			return total;
		}
		public void setTotal(Double total) {
			this.total = Math.round(total*100.00)/100.00;
		}
		public FinalProduct() {
			
		}
	     
}
