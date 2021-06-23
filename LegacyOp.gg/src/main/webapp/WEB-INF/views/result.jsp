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
.result_area{
	
	
	
	
}

.main_contents{
	width:1100px;
	background-color:white;
	border-radius:10px;
	margin-top:50px;
	height:1000px;
	padding-left:100px;
	padding-top:100px;
	
	margin:0 auto;
	
	

}
.result_area{
	display:flex;
	
	
}
.summoner_level{
	
	font-weight:bold;

}
.summoner_info{
	
}
.summoner{
	font-weight:bold;
	font-size:40px;
	
}
.Button_refresh{
 border: 1px solid #1a78ae;
    background: #1f8ecd;
    color: #f2f2f2;
    padding: 11px 14px 10px;
    border-radius: 2px;
    font-weight:bold;
    width:100px;
    text-align:center;
    cursor: pointer;
}
.image_rank img {
	width:20%;

}
.result_rank{
	margin-top:50px;
	
}
.left_rank_area{
	


		
	
	

}
.icon_area img {
 
 width:70%;

}
.icon_area{
	width:200px;
	
}
.rank_name{
	
	font-weight:bold;
	
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
		<div class="result_area">
			<div class="icon_area">
			
				<img src=<c:url value="${profileImgURL}"/> />
				<p class="summoner_level">${summonerLevel } </p> 
			</div>
			<div class="summoner_info">
				<p class="summoner"> ${SummonerName }  </p>
				
				<div class="Button_refresh">
					<div class="button_items" onclick="clickUpdate()">update</div>
				
				</div>
		
			
			
			</div>
		
		</div>
		<div class="result_rank">
			<div class="left_rank_area">
				<div class="image_rank">
					<div class= "rank_image_item">
					<h3>${queueType }</h3>
					
					<img src=<c:url value="https://opgg-static.akamaized.net/images/medals/${tier}_1.png?image=q_auto:best&v=1"/> />
					</div>
					<div class="rank_information">
					<p class="rank_name">${tier } </p>
					<p class="rank_point">${leaguePoints} LP / ${wins } win ${losses } lose</p>
					
					 </div>
					
				</div>
			
			</div>
		
		</div>
		
	
	
	
	
	</div>
	
	</div>
</body>
<script>
function clickUpdate()
{
	location.reload();
	return false;
	
}


</script>
</html>
