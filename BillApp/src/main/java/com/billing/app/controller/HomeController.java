package com.billing.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.billing.app.dao.BillDao;
import com.billing.app.dao.ProductDao;
import com.billing.app.model.FinalProduct;
import com.billing.app.model.Product;
@Controller
public class HomeController {
	 
    @Autowired
    private ProductDao pro;
   @Autowired
   private BillDao bill;
 
    @RequestMapping(value="/")
    public ModelAndView listProduct(ModelAndView model) throws IOException{
        List<Product> listProduct = pro.list();
        model.addObject("listPro", listProduct);
        model.setViewName("home");
        return model;
    }
    
   
    @RequestMapping(value = "/newProduct", method = RequestMethod.GET)
    public ModelAndView newProduct(ModelAndView model) {
        Product newPro = new Product();
        model.addObject("product", newPro);
        model.setViewName("ProForm");
        return model;
    }
    @RequestMapping(value = "updateProduct" , method = RequestMethod.POST)
    public ModelAndView updateProduct(@ModelAttribute Product product,HttpServletRequest request) {
    	String oldCode=request.getParameter("oldCode");
        Boolean success=pro.updateProduct(product,oldCode);
     
        if(success) {
         ModelAndView model=new ModelAndView("home");
         List<Product> listProduct = pro.list();
         model.addObject("listPro", listProduct);
        return new ModelAndView("redirect:/");
        }
        else {
        	   ModelAndView model=new ModelAndView("editForm");
        	model.addObject("display","Product Name already exists!!!Try Other Name");
        	return model;
        }
       
        
    }
    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public ModelAndView saveProduct(@ModelAttribute Product product,HttpServletRequest request) {

        Boolean success=pro.saveProduct(product);
    	
        if(!success) {
        	ModelAndView model=new ModelAndView("ProForm");
        	model.addObject("product", product);
        	model.addObject("display","Error!!!Product Already Exists!Try Some other Code or Name");
        	return model;
        }
        else {
        	ModelAndView mod=new ModelAndView("home");
        	  List<Product> listProduct = pro.list();
              mod.addObject("listPro", listProduct);
        	return mod;
        }
        
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
    public ModelAndView deleteProduct(HttpServletRequest request) {
        String pcode = request.getParameter("pcode");
        pro.delete(pcode);
        return new ModelAndView("redirect:/");
    }
    @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
    public ModelAndView editProduct(HttpServletRequest request) {
    	 String pcode = request.getParameter("pcode");
   
    	 
        Product p = pro.get(pcode);
        ModelAndView model = new ModelAndView("editForm");
        model.addObject("product", p);
        return model;
    }
    
    
    

    @RequestMapping(value="/moveBill")
    public ModelAndView moveBill(ModelAndView model) throws IOException{
    	 List<FinalProduct> listProduct = bill.list();
         model.addObject("list", listProduct);
         boolean k=false;
         Double gtot=0.0;
         if(listProduct.size()>0) {
        	 k=true;
         gtot=bill.getGrandTotal();
         }
         model.addObject("gtotal",gtot);
        model.setViewName("bill");
        model.addObject("MainTableDisplay", k);
        model.addObject("msg","");
        model.addObject("display","false");
        model.addObject("pro_obj",null);
        return model;
    }
    
    @RequestMapping(value="/doSearch",method = RequestMethod.POST)
    public ModelAndView doSearch(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String value=request.getParameter("pcode");
        Product p=pro.get(value);
        String c="false";
        boolean k=false;
        Double gtot=0.0;
        List<FinalProduct> li = bill.list();
        if(li.size()>0)
        gtot=bill.getGrandTotal();
        ModelAndView model=new ModelAndView("bill");
        if(p==null) {
        	p=pro.getByName(value);
        	if(p==null) {
        		k=true;
        		model.addObject("msg","Invalid Credentials!!Please Enter a valid Product Code or Name");
        	}
        	else {
        		c="true";
        		model.addObject("msg","");
        		k=true;
        	}
        }
        else {
        	c="true";
        	k=true;
        	model.addObject("msg","");
        }
        model.addObject("gtotal",gtot);
        model.addObject("MainTableDisplay", k);
        model.addObject("pro_obj", p);
        model.addObject("display",c);
        
        List<FinalProduct> listProduct = bill.list();
        model.addObject("list", listProduct);
    	return model;
    }
    
    @RequestMapping(value="/addToBill",method = RequestMethod.POST)
    public ModelAndView addToBill(HttpServletRequest request) throws IOException{
        int val=Integer.parseInt(request.getParameter("quan"));
        String code=request.getParameter("code");
     
        bill.addProduct(code, val);
       ModelAndView model=new ModelAndView("bill");
       
        return moveBill(model);
        
    }
    
    @RequestMapping(value="/addQuantity",method = RequestMethod.POST)
    public ModelAndView addQuantity(HttpServletRequest request) throws IOException{
        
        String qcode=request.getParameter("QuanCode");
        int quan=Integer.parseInt(request.getParameter("quantity"));

        bill.addQuantity(qcode,quan);
       ModelAndView model=new ModelAndView("bill");
       
        return moveBill(model);
        
    }
    
    @RequestMapping(value="/removeProduct",method = RequestMethod.GET)
    public ModelAndView removeProduct(HttpServletRequest request) throws IOException{
        
        String qcode=request.getParameter("procode");
        bill.removeProduct(qcode);
       ModelAndView model=new ModelAndView("bill");
        return moveBill(model);
        
    }
    
    @RequestMapping(value="/clearCart",method = RequestMethod.GET)
    public ModelAndView clearCart(HttpServletRequest request) throws IOException{
    	bill.clearEntry();
    	ModelAndView model=new ModelAndView("bill");
    	return moveBill(model);
    }
    	
    }
    
   
