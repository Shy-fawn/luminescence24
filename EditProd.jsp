<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 修改商品資訊</title>
  <link rel="stylesheet" href="CSS/index.css">
  <link rel="stylesheet" href="CSS/welcome.css">
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
          <li>訂單查詢</li>
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


 <div style="margin-top:210px; height: 700px;" >
<%
      String accnt = (String) session.getAttribute("UserId");

	  	String no=request.getParameter("prodno");
	  	String name=null;
	  	String pic=null;
	  	Float price=null;
	  	String feature=null;
	  	String spec=null;
	  	String supplier=null;
	  	
      try{  
    	  Class.forName("com.mysql.jdbc.Driver");  
    	  Connection con=DriverManager.getConnection(  
    	  "jdbc:mysql://localhost:3306/shoe_shop?serverTimezone=UTC","root","775320Yui");  

    	   
    	   Statement stmt=con.createStatement();
    	   ResultSet rs=null;
    	    	
    	    rs = stmt.executeQuery("select 商品名稱,圖片檔案 ,單價,商品特色,商品規格,供應商編號   from products where 商品編號 ='"+no+"'");  
    	  	rs.next();  
    	  	
    	  	name=rs.getString(1);
    	  	pic=rs.getString(2);
    	  	price=rs.getFloat(3);
    	  	feature=rs.getString(4);
    	  	spec=rs.getString(5);
    	  	supplier=rs.getString(6);
    	  	
      		stmt.close();
			con.close();

			} catch (Exception e) {
				out.println("<script type=\"text/javascript\">");
				String err = "商品資料修改失敗: 原因=" + e.getMessage();
				err = err.replaceAll("'", "");
				out.println("alert('" + err + "');");
				out.println("location='OperateProd.jsp;");
				out.println("</script>");
			}
 %>      
      <h3>修改商品資訊</h3>
      <hr>
        <form action="ReqHandler.jsp" >
        <input type="hidden" name="type"  value="updprod">
        
        <div class="data">
          <label>商品編號</label>
          <input type="text" class="form-name" name="no" value="<%=no%>" readonly>
        </div>

        <div class="data">
          <label>商品名稱</label>
          <input type="text" class="form-name" name="name" value="<%=name%>">
        </div>

        <div class="data">
          <label>圖片檔案</label>
          <input type="text" class="form-name" name="pic" value="<%=pic%>">
        </div>

        <div class="data">
          <label>單價</label>
          <input type="text" class="form-name" name="price" value="<%=price%>">
        </div>

        <div class="data">
          <label>商品特色</label>
          <input type="text" class="form-name" name="feature" value="<%=feature%>">
        </div>

        <div class="data">
          <label>商品規格</label>
          <input type="text" class="form-name" name="spec" value="<%=spec%>">
        </div>
        
		<div class="data">
          <label>供應商</label>
          <input type="text" class="form-name" name="supplier" value="<%=supplier%>">
        </div>
        
        <button style="margin-left:400px;margin-top:20px; width:200px; background-color: gray;"  type="submit">確定</button>
   </form>
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