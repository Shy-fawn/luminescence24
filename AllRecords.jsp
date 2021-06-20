<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>會員中心</title>
  <link rel="stylesheet" href="CSS/index.css">
  <link rel="stylesheet" href="CSS/welcome.css">
  <link rel="stylesheet" href="CSS/shop_record.css">
</head>


<body>
<script>

function beforeShopCart() {
 if (sessionStorage.cart != undefined) {
  document.getElementById("shopcart").href="yourcar.jsp?items=" + sessionStorage.cart;
 } else {
  document.getElementById("shopcart").href="yourcar.jsp";
 }
}
</script>

<div class="toptop">
    <nav id="title_menu">
      <a href="adm_index.html" class="Logogo">
        <img style="margin-top:30px; margin-right: 20px;width:70px; height:70px"src="Images/ourLogo.png" alt="鞋奏曲" class="Logo">
      </a>
   
      <li>
        <a href="#" class="main">商品管理</a>
        <ul class="sub">
         <a href="OperateProd.jsp">
          <li>編輯&刪除</li>
         </a>
         <a href="AddProd.jsp">
          <li>新增商品</li>
         </a>
        </ul>
      </li>

      <li>
        <a href="#" class="main">訂單管理</a>
        <ul class="sub">
        	<a href="AllRecords.jsp">
          		<li>訂單查詢</li>
          	</a>
        </ul>
      </li>
      
      <li>
      	<div style="margin-top: 20px;">
      		<a href="adm_login.html" class="sign_in" title="管理員專區">
          	<img style="width: 40px; height: 40px;" src="Images/Avatar.png"></a>
      	</div>
      </li>
    </nav>
  </div>


 <div style="margin-top:250px" >
   <h3>所有訂單資料</h3>
      <hr>
        
      <table id="shop_record">
      	<tr>
      		<th>購買日期</th>
      		<th>帳號</th>
      		<th>訂單編號</th>
      	</tr>
 	
 <%
      String accnt = (String) session.getAttribute("UserId");
      if(accnt == null) {
    	  out.println("<script type=\"text/javascript\">");
    	  String err = "使用者未登入!";
    	  out.println("alert('" + err + "');");
    	  out.println("location='member.html';");
    	  out.println("</script>");
    	  return;
    	 }
      

	  	String date =null;
	  	String ord_num=null;
	  	String accnt_name = null;
	  	
      try{  
    	  Class.forName("com.mysql.jdbc.Driver");  
    	  Connection con=DriverManager.getConnection(  
    	  "jdbc:mysql://localhost:3306/shoe_shop?serverTimezone=UTC","root","775320Yui");  

    	   
    	   Statement stmt=con.createStatement();
    	   ResultSet rs=null;
    	    	
    	   rs = stmt.executeQuery("select 購買日期,帳號, 訂單編號  from orders");  
    	   while(rs.next()) { 
    	  	
    	  	date=rs.getString(1);
    	  	accnt_name = rs.getString(2);
    	  	ord_num=rs.getString(3);
 %>
 		<tr>
      		<td><%=date%></td>
      		<td><%=accnt_name%></td>
      		<td><a href=<%="\"AdmDisplayOrder.jsp?odrno=" + ord_num + "\""%>><%=ord_num%></a></td>
      	
    	</tr>

      	
    	
<%
   		  
   			 }  // end while
   
    		 stmt.close();
   			 con.close();

			} catch (Exception e) {
				out.println("<script type=\"text/javascript\">");
				String err = "訂單查詢失敗: 原因=" + e.getMessage();
				err = err.replaceAll("'", "");
				out.println("alert('" + err + "');");
				out.println("location='change_edit.jsp';");
				out.println("</script>");
				}
 %>
    
      	
      	
      	
      	
      </table>
    </div>


    <footer style="margin-top:100px;">
      <div class="down" >
        <p>
          © 2021 by Chung Yuan Christian University <br>
          Department of Information Management
        </p>
        <p>
          +886-9888888 &nbsp;|&nbsp;
          <a href="lmjguto@gmail.com" style="color: #edf2fb;">lmjguto@gmail.com</a>
        </p>
        <p>
          本站最佳瀏覽環境請使用Google Chrome、Firefox或Edge以上版本
        </p>
      </div>
    </footer>
    <div class="pleaseup">
      <a href="#top">
        <img src="Images/up.png" alt="click and up">
      </a>
    </div>

  </div>
</body>

</html>