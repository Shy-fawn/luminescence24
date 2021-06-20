<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 編織復古粗跟涼拖鞋</title>
  <link rel="stylesheet" href="CSS/shoes_all.css">
  <link rel="stylesheet" href="CSS/index.css">
</head>

<body>
<script>

function addItemToCart() {
	if (sessionStorage.cart == undefined) {
		sessionStorage.cart = <%="\"" + request.getParameter("prodno") + "\""%>;
	} else {
		sessionStorage.cart += <%="\";" + request.getParameter("prodno") + "\""%>;
	}
}

function addItem() {
	addItemToCart();
	alert("商品已加入購物車, 謝謝您!");
	window.location.href = "AllProds.jsp";
}

function beforeSubmit() {
	addItemToCart();
	document.getElementById("prod_items").value = sessionStorage.cart;
}

function beforeSendComments() {
	 document.getElementById("comments").value = document.getElementById("txtarea").value;
	 return true;
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

 
  
   <% 
    String prodno = request.getParameter("prodno");
  	float price = 0;
  	String feature = null;
  	String spec = null;
  	String imgsrc = null;
  	String name = null;
  	int inventory = 0;
    try{  
	  Class.forName("com.mysql.jdbc.Driver");  
	  Connection con=DriverManager.getConnection(  
	  "jdbc:mysql://localhost:3306/shoe_shop?serverTimezone=UTC","root","775320Yui");  
	  
	  Statement stmt=con.createStatement();
	  
	  ResultSet rs=stmt.executeQuery("select 單價, 商品特色, 商品規格, 圖片檔案, 商品名稱, 庫存量 from products where 商品編號='" + prodno + "'");  
	  if(rs.next() == false) {
		  System.out.println("查無此商品: 商品編號=" + prodno);
		  return;
	  } else {
		 price = rs.getFloat(1);
		 feature = rs.getString(2);
		 spec = rs.getString(3);
		 imgsrc = rs.getString(4);
		 name = rs.getString(5);
		 inventory = rs.getInt(6);
	  }
	  
	  stmt.close();
	  con.close();  
	}catch(Exception e){ 
		System.out.println(e);
	}
  %>

<form id="intro_form" action="yourcar.jsp" onsubmit="return beforeSubmit();">
  <input type="hidden" id="prod_items" name="items" value="" />
  <div class="pro-card" style="margin-top: 600px;">
    <div class="iii">
      <img src=<%=imgsrc%>>
    </div>
    <div class="pro-info">
      <h2><%=name%></h2>
      <div class="verysmall">
        超取滿NT699免運
      </div>

      <span class="price">
        <ion-icon name="logo-usd"></ion-icon>
        NT$<%=price%>
      </span>
      
      <span class="price" style="font-size:12px;">
         	庫存量: <%=inventory%>
      </span>
      <h3>尺寸</h3>
      <span>
        <a href="#">JP22.5cm</a>
        <a href="#">JP23.0cm</a>
        <a href="#">JP23.5cm</a>
        <a href="#">JP24.0cm</a>
        <a href="#">JP24.5cm</a>
        <a href="#" style="margin-top: 8px;">JP25.0cm</a>
      </span>

      <button type="button" class="addto" onclick="addItem()">
        加入購物車</button>
      
      <button type="submit" class="addnow" style="margin-left: 255px;">
        立即購買
      </button> <br/>
      <div class="desc" style="margin-top:40px;">
        <h3>商品特色：</h3>
        <%=feature%>
      </div>

      <div class="speci">
        <h3>商品規格:</h3>
        <%=spec %>
      </div>


    </div>
  </div>
</form>

<div class="talk">
    商品評價
 </div>

<% 
try{  
	  Class.forName("com.mysql.jdbc.Driver");  
	  Connection con=DriverManager.getConnection(  
	  "jdbc:mysql://localhost:3306/shoe_shop?serverTimezone=UTC","root","775320Yui");  
   
   Statement stmt=con.createStatement();  
   String sql = "select 帳號, 商品編號, 評語, 評價, 日期, 圖檔名稱 from comments where 商品編號='" + prodno + "'";
   ResultSet rs=stmt.executeQuery(sql);  
   while(rs.next()) {
    String accnt = rs.getString(1);
    String no = rs.getString(2);
    String comments =rs.getString(3);
    int star_count = rs.getInt(4);
    Date date = rs.getDate(5);
    String pic = rs.getString(6);
    String full_star = "";
    for(int i = 0; i < star_count; i++) {
     full_star += "★";
    }
    
    int empty_star_count = 5 - star_count;
    
%>
  <div class="comshow">
    <div class="comshow1">
      <img src=<%=pic%> class="customer_say">

      <ul class="er">
        <li style="font-size: 24px; color: #9381ff;"><%=accnt%> </li>
        
      </ul>
      <p class="stime"><%=date%></p>
      <div class="text">
        <h4>評語</h4>
        <p><%=comments %></p>
      </div>
    </div>
    <div>
      <div class="ratingshow">
        <div class="ratings">
          <div class="empty_star">★★★★★</div>
          <div class="full_star"><%=full_star%></div>
        </div>
      </div>
    </div>
  </div>
  <%
       
     }  // end for 
     
      stmt.close();
     con.close();
  }catch(Exception e){ 
   System.out.println(e);
  }

  String user = (String) session.getAttribute("UserId");
  if(user != null) {
  %>


  <div class="conta">
    <div class="comment-send">
      <form id="commentForm" method="POST" action="ReqHandler.jsp" onsubmit="return beforeSendComments()";>
        <input type="hidden" name="type" value="comments">
        <input type="hidden" name="accnt" value=<%=user%>>
        <input type="hidden" name="prodno" value=<%=prodno%>>
        <input type="hidden" name="comments"  value="" id="comments">
        <span class="mment">
          <img src="Images/chatbubbles-outline.svg" alt="chat">
        </span>
        <textarea id="txtarea" class="comment-input" name="comment" form="commentForm" cols="80" rows="5"
          placeholder="請自覺遵守互聯網相關的政策法規，嚴禁不實的言論。"></textarea>
        <pre style="margin-left: 900px;">評分: <input name="starcount" type="number" min="1" max="5" value="5" style="width:30px; 
            background-color:#9CC7C6;"></pre>
        <button type="submit" class="comment-button" style="vertical-align:middle"><span>發表評論 </span></button>
      </form>
    </div>
  </div>
  
 <% 
  }  // end if 
 %>

  <footer>
    <div class="down">
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