<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
       
        body{
        background-image:url('imgsrc/mainpage.jpg');
        background-size:cover;
        background-attachment:fixed;
        background-position:center;
       }
        
          .Cancel{
           display:block;
    padding:0.5rem 1rem;
            color:#fff;
        background-color:#1E90FF;
    text-decoration:none;
    transition:all 0.3s ease-in-out; 

    }
        .Cancel:hover{
        transform:scale(0.925);
        }
    
    .table-container{
    width:700px;
   background-color:#fafafa;
    padding:2rem;
    position:absolute;
    top:20%;
    left:3%; 
    }
    
      table{
        margin:0 auto;
        border:1px solid transparent;
         border-collapse:collapse;
        }
        td,th{
        height:35px;
        width:75px;
        border:none;
        text-align:center;
        }
       .cart-btn{
       position:fixed;
       top:2rem;
       right:2rem;
       display:block;
       padding:1rem 1.5rem;
       background-color:#ffffff;
       text-decoration:none;
       color:#4169E1;
       font-weight:700;
       font-family: "Lucida Console", Courier, monospace;
       font-size:1.4rem;
       }
       
        .main-heading{
        display:block;
        width:max-content;
        padding:1rem 1.5rem;
        background-color:#1E90FF;
        color:#fafafa;
        margin:1.5rem auto 2rem;
        }
        
        
        .pos{
        width:max-content;
        top:2rem;
        left:2rem;
        }
        td{
        color:#666;
        }
        
        th{
        color:#fff;
        background-color:#1E90FF;
        }
        tr:hover {background-color: #f5f5f5;}
        tr:nth-child(odd) {background-color: rgba(30,144,255,0.2);}
       
        .remove{
        border-right:none;
        }
        
        </style>
    </head>
    <body>
      <a href="/moveBill" class="cart-btn">Go To Cart&nbsp;&#8594;</a>
        <a href="/newProduct" class="cart-btn pos">&#43;&nbsp;New Product</a>
    
        <div class="table-container">
            <h1 class="main-heading">Our Products</h1>
            
            
            
            <table border="1" cellpadding="5px">
            <tr>
                <th>S.No</th>
                <th>Name</th>
                <th>Code</th>
                <th>Price</th>
                <th>GST</th>
                <th colspan="2">Action</th>
               </tr>
                 
                <c:forEach var="product" items="${listPro}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${product.pname}</td>
                    <td>${product.pcode}</td>
                    <td>${product.price}</td>
                    <td>${product.gst}</td>
                    <td class="remove">
                        <a href="/editProduct?pcode=${product.pcode}" class="Cancel">Edit</a>
                        </td>
                     <td>
                        <a href="/deleteProduct?pcode=${product.pcode}" onclick="return confirm('Product Details will be Permanently Removed?')" class="Cancel" >Delete</a>
                    </td>
                             
                </tr>
                </c:forEach>             
            </table>
            
        </div>
      
         <script>
           if("${display}".localeCompare("no"))
              window.alert("${display}");
              
        </script>
    </body>
</html>