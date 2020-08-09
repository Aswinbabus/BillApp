<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Contact</title>
<style>
 
    .Cancel{
           display:inline-block;
           cursor:pointer;
    padding:0.5rem 1rem;
            color:#fff;
            width:max-content;
        background-color:rgba(255,105,180,0.8);
    text-decoration:none;
    transition:all 0.3s ease-in-out; 
    font-size:1.3rem;
    margin:0 1rem;

    }
   
        .Cancel:hover{
        transform:scale(0.925);
        }
    
    input[type=text],input[type=number]{
     border:2.5px solid rgba(255,105,180,0.4);
     width:300px;
    }
    input[type=text]:hover,input[type=number]:hover{
     border:2.5px solid rgba(255,105,180,0.8);
    }        
    
    
    input
    {
    outline:none;
    }
    input[type=submit]{
    border:none;
    }
    
    .table-container{
    background-color:#fff;
    width:max-content;
    padding:2rem 3rem;
    position:absolute;
    top:50%;
    right:8%;
    transform:translateY(-50%);
    border-radius:1rem;
    }
    table{
    margin:0 auto;
    }
    body{
    background-image:url('imgsrc/billpage.jpg');
    background-size:cover;
    background-position:center;
    
    }
    
    td{
    font-size:1.3rem;
    text-align:center;
    }
    
    
      .main-heading{
        display:block;
        width:max-content;
        padding:1rem 1.5rem;
        background-color:rgba(255,105,180,0.8);
        color:#fafafa;
        margin:1.5rem auto 2rem;
        }
    .msg{
    font-size:1.2rem;
    color:#666;
    text-align:center;
    .Cancel{
           display:inline-block;
    padding:0.5rem 1rem;
            color:#fff;
        background-color:#1E90FF;
    text-decoration:none;
    transition:all 0.3s ease-in-out; 

    }
        .Cancel:hover{
        transform:scale(0.925);
        }
    
    }
  .cart-btn{
       position:fixed;
       top:2rem;
       left:2rem;
       display:block;
       padding:1rem 1.5rem;
       background-color:#ffffff;
       text-decoration:none;
       color:rgba(255,105,180,0.8);
       font-weight:700;
       font-family: "Lucida Console", Courier, monospace;
       font-size:1.4rem;
       }
 
</style>
</head>
<body onload="func()">
 <a href="/" class="cart-btn ">&#8592;&nbsp;Back To Products</a>
    <div class="table-container">
        <h1 class="main-heading">Add the Product Details</h1>
        <form:form action="saveProduct" name="form" method="post" modelAttribute="product">
         <h2 class="msg">${display}</h2>
        <table cellpadding="10px" >

         
         <tr>
                <td class="index">Code</td>
                <td><form:input path="pcode" name="procode" maxlength="10" required="required"/></td>
            </tr>
  
            <tr>
                <td class="index">Name</td>
                <td><form:input path="pname" maxlength="20" required="required"/></td>
            </tr>
            <tr>
                <td class="index">Price</td>
                <td><form:input path="price" type="number" min="1" step="0.01" required="required"/></td>
            </tr>
            <tr>
                <td class="index">Gst</td>
                <td><form:input path="gst" type="number" min="1" step="0.01" max="100" required="required"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center" ><input type="submit" class="Cancel" value="Save">
               
            </tr>
        </table>
        </form:form>
        </div>
<script>

function func(){

	document.querySelector("form").reset();
	
}

</script>
</body>
</html>