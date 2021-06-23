<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
	<title>Home</title>
</head>
<style>
*{
padding:0;
margin:0;
}
.nav_container{
background-color:black;
color:white;
display:flex;
padding:5px;

font-size:13px;





}
body{
background-color:rgb(21, 107, 255);
}
.items{
list-style:none;
display:flex;
}
.item-list{
	display:flex;
	align-items: center;	
}
.opgg_logo{
margin: 12px 16px;
    width: 57px;
    height: 14px;
}
.opgg_logo img{
	width:100%;

}
.item-list{
	padding-left:10px;
	padding-right:10px;
	
}
.main_banner{
	text-align:center;
	margin-top:50px;
	margin-bottom:20px;
	
	
	
}
.user_search
{
	width:600px;
	margin:0 auto;
	
}
.search_title{
	color:white;
	font-weight:bold;
	text-align:center;
	font-size:50px;
	
	
}

</style>
<body>
	<div class="main_wrap">
		<header class="nav_container">
			<div class="opgg_logo">
			<h1>  </h1>
			<img src="https://opgg-static.akamaized.net/images/gnb/svg/00-opgglogo.svg">
			</div>
			<nav class="nav_items">
				<ul class="items">
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-lol-white.svg"><p>League of Legends</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-pubg-gray.svg"><p>PUBG</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-overwatch-gray.svg"><p>OVERWATCH</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-fortnite-gray.svg"><p>FORTNITE</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-r-6-gray.svg"><p>RainbowSix Siege</p> </li>
					
				
				
				</ul>
			
			
			</nav>
		
		</header>
	
	
	
	<div class="main_contents">
		
		<div class="main_banner">
			<img src="http://attach.s.op.gg/logo/20201128185021.1dc5306e4b9ee7c30611adce774fbd77.png">
		
		</div>
		<div class="user_search">
		<p class="search_title">insert summoner name!</p>
		
		<form action="/myopggapp/search" method="GET">
	
		<div class="input-group mb-3">
		
		
		  <input type="text" class="form-control" placeholder="name+ enter " aria-label="Username" name="SummonerName"aria-describedby="basic-addon1">
		</div>
		</form>
				
		</div>
	
	
	
	</div>
	</div>
</body>
</html>
