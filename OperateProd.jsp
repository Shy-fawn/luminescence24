<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>管理員-商品修改</title>
  <link rel="stylesheet" href="CSS/index.css">
  <link rel="stylesheet" href="CSS/welcome.css">
  <link rel="stylesheet" href="CSS/shop_record.css">
</head>


<body>
<script>
function editProd(prodno) {
	window.location.href = "EditProd.jsp?prodno=" + prodno;
}

function delProd(prodno) {
	window.location.href = "ReqHandler.jsp?type=delprod&prodno=" + prodno;
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


 <div style="margin-top:200px; margin-bottom:50px; height: auto;" >
      <h3>商品資料操作</h3>
      <hr>
        
      <table id="shop_record">
      	<tr>
      		<th>商品編號</th>
      		<th>商品名稱</th>
      		<th>操作</th>
      	</tr>
 
<%
 
 try{  
   Class.forName("com.mysql.jdbc.Driver");  
   Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/shoe_shop?serverTimezone=UTC","root","775320Yui");  
   
   Statement stmt=con.createStatement();
   ResultSet rs=null;
   
   rs = stmt.executeQuery("select 商品編號, 商品名稱 from products");
   while(rs.next()) { 
  		String no=rs.getString(1);
  		String prod=rs.getString(2);
%> 	
      	<tr>
      		<td><%=no%></td>
      		<td><%=prod%></td>
      		<td><div id="divbut"><input id="opbut" type="button" onclick=<%="\"editProd('"+no+"')\""%> value="編輯" > 
 				<input type="button" id="opbut" onclick=<%="\"delProd('"+no+"')\""%> value="刪除" ></div></td>
    	</tr>
    	
<%
   		  
    }  // end while
   
     stmt.close();
    con.close();
 }catch(Exception e){ 
  System.out.println(e);
 }
%>
      	
      </table>
    </div>


    <footer style="margin-top:200px;">
      <div class="down" >
        <p>
          c 2021 by Chung Yuan Christian University <br>
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