<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品總覽</title>
  <link rel="stylesheet" href="CSS/all_shop.css">
  <link rel="stylesheet" href="CSS/index.css">
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

<!--第一組清單 -->
  <div class="toptop">
    <ul class="minitop">
      <li>
        <a href="member.html" class="sign_in" alt="會員專區">
          <img src="Images/Avatar.png"></a>
      </li>

      <li>
          <a href="#" id="shopcart" onclick="beforeShopCart()" class="sign_in" title="我的購物車">
          <img src="Images/shopping-cart .png"></a>
      </li>
    </ul>

    <nav id="title_menu">
       <a href="index.html" class="Logogo">
        <img src="Images/ourLogo.png" alt="鞋奏曲" class="Logo">
      </a>
      <li>
        <a href="#" class="main">商品總覽</a>
        <ul class="sub">
          <a href="AllProds.jsp">
            <li>全站商品</li>
          </a>
          <a href="Hot.html">
          	<li>熱門排行榜</li>
          </a>
        </ul>
      </li>

      <!--第二組清單 -->
      <li>
        <a href="#" class="main">購物說明</a>
         <ul class="sub">
        <a href="youneed.html">
          <li>購物須知</li>
         </a>
         <a href="many_question.html">
          <li>常見問題</li>
         </a> 
        </ul>

      </li>
      <!--第三組清單 -->

      <li>
        <a href="welcome.jsp" class="main">會員中心</a>
        <ul class="sub">
          <a href="shopping_record.jsp">
            <li>查詢購物紀錄</li>
          </a>
          <a href="change_edit.jsp">
            <li>修改基本資料</li>
          </a>

        </ul>
      </li>

      <!--第四組 -->
      <li>
        <a href="#" class="main">關於我們</a>
        <ul class="sub">
         <a href="Brand.html">
          <li>品牌理念</li>
          </a>
          <a href="myteam.html"> 
          <li>組員介紹</li>
          </a>
        </ul>
      </li>
    </nav>

    <div id="search_box">
      <div class="search_bar">
        <form>
          <input type="text" placeholder="請輸入關鍵字">
          <button type="submit"></button>
        </form>
      </div>
    </div>
    </div>
  
  <div class="shop_pic" style="margin-top: 200px;">
  
  <% 
  	try{  
	  Class.forName("com.mysql.jdbc.Driver");  
	  Connection con=DriverManager.getConnection(  
	  "jdbc:mysql://localhost:3306/shoe_shop?serverTimezone=UTC","root","775320Yui");  
	  
	  Statement stmt=con.createStatement();  
	  ResultSet rs=stmt.executeQuery("select 商品名稱, 圖片檔案, 商品編號 from products");  
	  while(rs.next()) {
		  String name = rs.getString(1);
		  String pic = rs.getString(2);
		  //System.out.println("name=" + name + "  pic=" + pic);
		  String refjsp = "ShoeIntro.jsp?prodno=" + rs.getString(3); 
  %>
     <a href=<%=refjsp%>>
       <img src=<%=pic%> alt=<%=name%>  title=<%=name%>>	
	 </a>
  <%  
	  } // end while
	  
	  stmt.close();
	  con.close();  
	}catch(Exception e){ 
		System.out.println(e);
	}  
  %>
  </div>

  <footer>
    <div class="down" style="margin-top: 50px;">
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


</body>

</html>