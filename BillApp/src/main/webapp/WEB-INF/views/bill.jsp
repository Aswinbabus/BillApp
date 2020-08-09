<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
        *,*::before{
        margin:0;
        padding:0;
        }
        
       .cart-btn{
       position:fixed;
       top:2rem;
       left:2rem;
       display:block;
       padding:1rem 1.5rem;
       background-color:#ffffff;
       text-decoration:none;
       color:#4169E1;
       font-weight:700;
       font-family: "Lucida Console", Courier, monospace;
       font-size:1.4rem;
       }

        body{
        margin:0;
        padding:0;
        min-height:100vh;
        max-width:100vw;
         background-color: #00b7ff;
background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='540' height='450' viewBox='0 0 1080 900'%3E%3Cg fill-opacity='.1'%3E%3Cpolygon fill='%23444' points='90 150 0 300 180 300'/%3E%3Cpolygon points='90 150 180 0 0 0'/%3E%3Cpolygon fill='%23AAA' points='270 150 360 0 180 0'/%3E%3Cpolygon fill='%23DDD' points='450 150 360 300 540 300'/%3E%3Cpolygon fill='%23999' points='450 150 540 0 360 0'/%3E%3Cpolygon points='630 150 540 300 720 300'/%3E%3Cpolygon fill='%23DDD' points='630 150 720 0 540 0'/%3E%3Cpolygon fill='%23444' points='810 150 720 300 900 300'/%3E%3Cpolygon fill='%23FFF' points='810 150 900 0 720 0'/%3E%3Cpolygon fill='%23DDD' points='990 150 900 300 1080 300'/%3E%3Cpolygon fill='%23444' points='990 150 1080 0 900 0'/%3E%3Cpolygon fill='%23DDD' points='90 450 0 600 180 600'/%3E%3Cpolygon points='90 450 180 300 0 300'/%3E%3Cpolygon fill='%23666' points='270 450 180 600 360 600'/%3E%3Cpolygon fill='%23AAA' points='270 450 360 300 180 300'/%3E%3Cpolygon fill='%23DDD' points='450 450 360 600 540 600'/%3E%3Cpolygon fill='%23999' points='450 450 540 300 360 300'/%3E%3Cpolygon fill='%23999' points='630 450 540 600 720 600'/%3E%3Cpolygon fill='%23FFF' points='630 450 720 300 540 300'/%3E%3Cpolygon points='810 450 720 600 900 600'/%3E%3Cpolygon fill='%23DDD' points='810 450 900 300 720 300'/%3E%3Cpolygon fill='%23AAA' points='990 450 900 600 1080 600'/%3E%3Cpolygon fill='%23444' points='990 450 1080 300 900 300'/%3E%3Cpolygon fill='%23222' points='90 750 0 900 180 900'/%3E%3Cpolygon points='270 750 180 900 360 900'/%3E%3Cpolygon fill='%23DDD' points='270 750 360 600 180 600'/%3E%3Cpolygon points='450 750 540 600 360 600'/%3E%3Cpolygon points='630 750 540 900 720 900'/%3E%3Cpolygon fill='%23444' points='630 750 720 600 540 600'/%3E%3Cpolygon fill='%23AAA' points='810 750 720 900 900 900'/%3E%3Cpolygon fill='%23666' points='810 750 900 600 720 600'/%3E%3Cpolygon fill='%23999' points='990 750 900 900 1080 900'/%3E%3Cpolygon fill='%23999' points='180 0 90 150 270 150'/%3E%3Cpolygon fill='%23444' points='360 0 270 150 450 150'/%3E%3Cpolygon fill='%23FFF' points='540 0 450 150 630 150'/%3E%3Cpolygon points='900 0 810 150 990 150'/%3E%3Cpolygon fill='%23222' points='0 300 -90 450 90 450'/%3E%3Cpolygon fill='%23FFF' points='0 300 90 150 -90 150'/%3E%3Cpolygon fill='%23FFF' points='180 300 90 450 270 450'/%3E%3Cpolygon fill='%23666' points='180 300 270 150 90 150'/%3E%3Cpolygon fill='%23222' points='360 300 270 450 450 450'/%3E%3Cpolygon fill='%23FFF' points='360 300 450 150 270 150'/%3E%3Cpolygon fill='%23444' points='540 300 450 450 630 450'/%3E%3Cpolygon fill='%23222' points='540 300 630 150 450 150'/%3E%3Cpolygon fill='%23AAA' points='720 300 630 450 810 450'/%3E%3Cpolygon fill='%23666' points='720 300 810 150 630 150'/%3E%3Cpolygon fill='%23FFF' points='900 300 810 450 990 450'/%3E%3Cpolygon fill='%23999' points='900 300 990 150 810 150'/%3E%3Cpolygon points='0 600 -90 750 90 750'/%3E%3Cpolygon fill='%23666' points='0 600 90 450 -90 450'/%3E%3Cpolygon fill='%23AAA' points='180 600 90 750 270 750'/%3E%3Cpolygon fill='%23444' points='180 600 270 450 90 450'/%3E%3Cpolygon fill='%23444' points='360 600 270 750 450 750'/%3E%3Cpolygon fill='%23999' points='360 600 450 450 270 450'/%3E%3Cpolygon fill='%23666' points='540 600 630 450 450 450'/%3E%3Cpolygon fill='%23222' points='720 600 630 750 810 750'/%3E%3Cpolygon fill='%23FFF' points='900 600 810 750 990 750'/%3E%3Cpolygon fill='%23222' points='900 600 990 450 810 450'/%3E%3Cpolygon fill='%23DDD' points='0 900 90 750 -90 750'/%3E%3Cpolygon fill='%23444' points='180 900 270 750 90 750'/%3E%3Cpolygon fill='%23FFF' points='360 900 450 750 270 750'/%3E%3Cpolygon fill='%23AAA' points='540 900 630 750 450 750'/%3E%3Cpolygon fill='%23FFF' points='720 900 810 750 630 750'/%3E%3Cpolygon fill='%23222' points='900 900 990 750 810 750'/%3E%3Cpolygon fill='%23222' points='1080 300 990 450 1170 450'/%3E%3Cpolygon fill='%23FFF' points='1080 300 1170 150 990 150'/%3E%3Cpolygon points='1080 600 990 750 1170 750'/%3E%3Cpolygon fill='%23666' points='1080 600 1170 450 990 450'/%3E%3Cpolygon fill='%23DDD' points='1080 900 1170 750 990 750'/%3E%3C/g%3E%3C/svg%3E");
        background-size:cover;
        background-position:center;
        background-repeat:no-repeat;
        }
        .inner-container{
        background-color:#fafafa;
        padding:2rem 3rem;
        position:absolute;
        top:50%;
        left:50%;
        min-width:800px;
        transform:translate(-50%,-50%);
        }
        .inner-container table{
        border-color:transparent;
         border-collapse: collapse;
        }
        td,th{
        height:50px;
        width:100px;
        text-align:center;
        }
          td{
        color:#666;
        }
        
        th{
        color:#fff;
        background-color:#1E90FF;
        }
        tr:hover {background-color: #f5f5f5;}
        tr:nth-child(even) {background-color: rgba(30,144,255,0.2);}
       
         .bottom{
        margin:2rem auto;
        }
        .quanClass{
        width:50px;
        }
        
        .short{
        margin:0 auto;
        width:60px;
        border:1px solid #888;
        }
        .short:focus{
        border:1px solid #222;
        }
        
        .heading{
        text-align:center;
        letter-spacing:2px;
        text-transform:uppercase;
        margin:1rem;
        }
        .search-label{
         font-style:italic;
         font-size:1.3rem;
         
        }
        
        input[type=submit]{
        outline:none;
        border:none;
        }
        .search{
       
        padding:0.2rem 0.5rem;
        margin:1rem;
        outline:none;
        border:2px solid rgba(30, 144, 255,0.3);
        margin-left:0.4rem;
        }
        .search:focus{
        border:2px solid rgba(30, 144, 255,0.8);
        }
        
        .search-bar{
        width:100%;
        margin:0 auto;
        
        }
        .error{
        font-style:italic;
        color:red;
        text-align:center;
        font-size:1.2rem;
        margin:1.5rem auto;
        }
        .main-heading{
        display:block;
        width:max-content;
        padding:1rem 1.5rem;
        background-color:#1E90FF;
        color:#fafafa;
        margin:1.5rem auto 2rem;
        border-radius:2rem;
        }
        
        .Cancel{
           display:inline-block;
    padding:0.5rem 1rem;
    width:max-content;
            color:#fff;
        background-color:#1E90FF;
    text-decoration:none;
    transition:all 0.3s ease-in-out; 

    }
        .Cancel:hover{
        transform:scale(0.925);
        }
        .flex-container{
        display:flex;
        justify-content:space-around;
        align-items:center;
        width:100%;
        }
        
        </style>
    </head>
    <body>
        <div class="container">
        <a href="/" class="cart-btn ">&#8592;&nbsp;Back To Products</a>
        <div class="inner-container">
            <h1 class="main-heading">Cart</h1> 
           <div class="search-bar">
            <form:form action="doSearch" method="post">
            
            <div class="flex-container">
            <div>
                     <label class="search-label" for="pcode">Search</label>
              <input type="text" name="pcode" id="pcode" class="search" placeholder="Enter the Product Code">
              
              
              <input type="submit" class="Cancel" value="Search">
              </div>
                 <% 
          if((boolean)request.getAttribute("MainTableDisplay"))
          {
        	 %>
              <div><a href="/clearCart" onclick="return confirm('All the Product Details will be Removes from Cart?')" class="Cancel">Clear Cart</a></div>
              <%
          }
              %>
             </div> 
             </form:form> 
              <h5 class="error">${msg}</h5>
             </div> 
          <%
          Boolean b;
          String k=(String)request.getAttribute("display");
          if(k=="true")
        	  b=true;
          else
        	  b=false;
          if(b)
          {
        	 %>
        	  
        <table onload="func()" class="bottom" border='1' cellpadding='5px'><tr><th>Name</th><th>Code</th><th>Price</th><th>GST</th><th>Quantity</th><th>Action</th></tr><tr><td>${pro_obj.pname}</td><td>${pro_obj.pcode}</td><td>${pro_obj.price}</td><td>${pro_obj.gst}</td><form:form action='addToBill?code=${pro_obj.pcode}' method='post'> <td><input type='number' name='quan' class='short' value='1'></td><td><input type='submit' class='Cancel' value='Add'></td></form:form></tr></table>
        <% 
        }
        %>
        
        
         <% 
          if((boolean)request.getAttribute("MainTableDisplay"))
          {
        	 %>
         <table border="1" cellpadding="50px">
            <tr>
            <th>S.no</th>
            <th>Name</th>
            <th>Code</th>
            <th>Price(1 unit)</th>
            <th>GST</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Remove</th>
            </tr> 
           
            </table>
            
             <% 
          }
             %>
           <table border="1" cellpadding="50px">
            <c:forEach var="product" items="${list}" varStatus="status">
             
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${product.pname}</td>
                    <td>${product.pcode}</td>
                    <td>${product.price}</td>
                    <td>${product.gst}</td>
                      <td>  <form action="addQuantity?QuanCode=${product.pcode}" method="post">
                    <input name="quantity" class="quanClass" onchange="this.form.submit()" value="${product.quantity}" required/>
                     </form> </td>
                    <td>${product.total}</td>
                    <td>
                        <a href="/removeProduct?procode=${product.pcode}"  class="Cancel">Remove</a>
                    </td>
                           
                </tr>
                 
                </c:forEach>  
                <% 
          if((boolean)request.getAttribute("MainTableDisplay"))
          {
        	 %>
                <tr>
                
                <td colspan="5" align="right">Grand Total</td>
                <td colspan="3" align="left">${gtotal}</td>
                
                </tr>

                      <% 
          }
             %>
                </table> 
                
                </div>
        </div>
  


</body>
</html>