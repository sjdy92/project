<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.item.ItemVo"%>

<!DOCTYPE html">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<script src="jquery-1.11.1.min.js "></script>
<script type="text/javascript" src="./js/search.js"></script>

<link rel="stylesheet" href="./style/search1.css" type="text/css">
<link rel="stylesheet" href="./style/option.css" type="text/css">


<title>DUMBOs</title>
<style>
a{text-decoration:none;}li{list-style:none;}
html, body {height:95%;}
#map-container {position:fixed;}
#map-canvas{width: 100%;height: 100%;}
.maemool{ border-bottom: 1px solid gray; }
#article_maemool_detail{position:absolute; background-color: white;box-shadow: -3px 0px 2px 0px gray; z-index:100000;}
</style>

<!-- google . js 에 들어가야 할것 . -->
	<%
	String lat="";
	String lng="";
	
	// 세션에 저장된 위도 경도  ( lat , lng ) 받기 
	if(session != null && session.getAttribute("lat")!=null)
	{
	  	lat =(String)session.getAttribute("lat"); 
	}
	
    if(session != null && session.getAttribute("lng")!=null)
	{
    	lng =(String)session.getAttribute("lng");
	}
	%>
	

<script>

var w = screen.availWidth||window.innerWidth || document.documentElement.clientWidth
|| document.body.clientWidth;
var h =screen.availHeight|| window.innerHeight || document.documentElement.clientHeight
|| document.body.clientHeight;

var geocoder;
var map;
var mainMap;
var x = 0;

function Maemool(seq,address,lat,lng) {
    this.seq = seq;
    this.address = address;
    this.lat=lat;
    this.lng=lng;
}
Maemool.prototype.toString = function maemoolToString() {
	  var ret = this.seq+','+this.address+','+ this.lat + ',' + this.lng;
	  return ret;
	}
var maemoolObject= [];
var maemoolMarkerArr=[];


var index=0;
<% 

///////////////////////////////////////////// HashMap < SEQ , ADDRESS > 갖고 오기  
HashMap<String, String> addressHash = null;
if(request.getAttribute("addressHash") != null && ((HashMap)request.getAttribute("addressHash")).size() > 0)
{
	addressHash = (HashMap)request.getAttribute("addressHash");
}
Iterator<String> keys = addressHash.keySet().iterator();

while( keys.hasNext() ){
    String key = keys.next();
    String value = addressHash.get(key);
%>
	var maemool = new Maemool("<%=key%>", "<%=value%>");
	maemoolObject[index]= maemool;
	index++;
<%
}
%>

function initialize() {

	document.getElementById("map-container").style.height = h - 110 + 'px';
	document.getElementById("map-container").style.width = w * 2/3 + 'px';

	document.getElementById("maemool_with_option").style.marginLeft = w * 2 / 3+ 'px';
	document.getElementById("maemool_with_option").style.width = w * 1 / 3+ 'px';
	document.getElementById("maemool_with_option").style.height = h - 110 + 'px';

	document.getElementById("article_maemool_detail").style.marginLeft = w + 15+ 'px';
	document.getElementById("article_maemool_detail").style.width = w * 2/3 - 15 + 'px';
	document.getElementById("article_maemool_detail").style.height = h - 110 + 'px';
	
	
		geocoder = new google.maps.Geocoder();
	
	var latlng = new google.maps.LatLng(<%=lat%>,<%=lng%> );
	
	var mapOptions = {
		zoom : 15,
		center :latlng,
		zoomControl : false,
		scaleControl : false
	}
	map = new google.maps.Map(document.getElementById('map-canvas'),
			mapOptions);

	var input = (document.getElementById('address'));
	var defaultBounds = new google.maps.LatLngBounds(
			new google.maps.LatLng(33.8902, 126.1759),
			new google.maps.LatLng(33.8474, 126.2631));

	var options = {
		bounds : defaultBounds,
		types : [ 'geocode' ],
		componentRestrictions : {
			country : 'kr'
		}
	};
	var autocomplete = new google.maps.places.Autocomplete(input, options);
	autocomplete.bindTo('bounds', map);

	google.maps.event.addListener(autocomplete, 'place_changed',
			function() {
				document.getElementById("address").value = '';
				var place = autocomplete.getPlace();
				if (!place.geometry) {
					return;
				}
				// If the place has a geometry, then present it on a map.
				if (place.geometry.viewport) {
					map.fitBounds(place.geometry.viewport);
				} else {
					map.panTo(place.geometry.location);
				
				}
				var address = '';
			});
	
	google.maps.event.addListener(map, 'dragend', function(event) {
		googleEventHandler();
	});
	google.maps.event.addListener(map, 'zoom_changed', function() {
		googleEventHandler();
	});
	google.maps.event.addListener(map, 'click', function() {
		closeButton();
	});
	
	for(var i=0; i<maemoolObject.length;i++){
		toLatLngFromAddress(maemoolObject[i]);
	}

}


/////////////////////////////////////////////////////////   지오 코딩 ( 주소 - > 위도,경도 ) 을 한뒤 MARKER 만들기 (addMarker 함수 )
function toLatLngFromAddress(maemool){
	
	geocoder.geocode({
		'address' : maemool.address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			//maemoolArr.push(results[0].geometry.location);
			maemool.lat = results[0].geometry.location.lat();
			maemool.lng = results[0].geometry.location.lng();
			addMarker(maemool);
		} else {
			alert('Geocode was not successful for the following reason: '
					+ status);
		}
	});
	
}

///////////////////////////////////////////////////[ parameter = Maemool Object ( seq,address,lat,lng ) ]  차후 매물의 유형(매매,전세,월세)을 넣어 아이콘을 다르게 넣어야함 
function addMarker(maemool) {

	var location = new google.maps.LatLng(maemool.lat, maemool.lng);
	
	var context = '<div><p>'+maemool.seq+'</br>'+maemool.address+'</br>'+location+'</p></div>';	
	var infowindow = new google.maps.InfoWindow({
	      content: context
	  });

	var marker = new google.maps.Marker({
		position : location,
		map : map,
		title :maemool.toString()
	});
	maemoolMarkerArr.push(marker);  //////////마커를 maemoolMarkerArr에 차곡차고 쌓음. 
	
	google.maps.event.addListener(marker, 'mouseover', function() { 
	    infowindow.open(map,marker);
	  });
	google.maps.event.addListener(marker, 'mouseout', function() {
	    infowindow.close();
	  });
	google.maps.event.addListener(marker, 'click', function() {
		var maemoolObj = marker.getTitle().split(",");
		var seq = maemoolObj[0];
		var trObj = document.getElementById(seq);
		item_box_click(trObj);
	  });
	
	googleEventHandler();

}

////////////////////////////////////////  search 창에서 SEARCH 버튼 클릭시 
function codeAddress() {
	var address = document.getElementById('address').value;
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			map.panTo(results[0].geometry.location);
		} else {
			alert('Geocode was not successful for the following reason: '+ status);
		}
	});
	
}
//////////////////////////////////////////////////////////////	GOOGLE MAP EVENT HANDLER : zoom_changed, dragend ( map을 드래그 했다 땟을때 )
function googleEventHandler(){
	var bound = map.getBounds();
	if (maemoolObject.length > 0) {

		$("#article_maemool").empty();

		for ( var i = 0; i < maemoolMarkerArr.length; i++) {
			if (bound.contains(maemoolMarkerArr[i].getPosition())) {
				var maemoolObj = maemoolMarkerArr[i].getTitle().split(",");
				googleEventAndChange(maemoolObj);
			} else {
			}
		}

	}
}
/////////////////////////////////////////////////////// 
function googleEventAndChange(maemool) {	
    
         /// 간략 매물 정보 
            var html = ''
        	html +="<tr class='maemool' onclick='javascript:item_box_click(this)' onmouseover='javascript:item_box_mouseToggle(this,true)' onmouseout='javascript:item_box_mouseToggle(this,false)'   id='" +maemool[0]+"'>";
        	html +="<td><INPUT class='seq' type='hidden' value="+maemool[0]+" name='SEQ'><a><img src='http://placehold.it/100x100' /></a></td>";
        	html +="<td><p> 매물번호 : "+maemool[0]+"</br>주소 : "+maemool[1]+"</br>좋은 일을 생각하면 좋은 일이 생긴다. 나쁜 일을 생각하면 나쁜 일이 생긴다. 여러분은 여러분이 하루 종일 생각하고 있는 것 바로 그것 이다. - 조셉 머피 -</p></td>";
        	html +="</tr>";
        	
        	$("#article_maemool").append(html);
        
}

/////////////////////////////////////////////////////////////////////// article_maemool EVENT 처리  : onmouseover, onmouseout
var infowindow;
function item_box_mouseToggle(trObj, bool) {
	if (bool) {								/// info가 켜져있지 않고 
			var bound = map.getBounds();
		if (maemoolMarkerArr.length > 0) {   //// 마커 가 있고 
			for (var i = 0; i < maemoolMarkerArr.length; i++) {
				if (bound.contains(maemoolMarkerArr[i].getPosition())) {  //// 바운딩 되어 있으면
					var maemoolObj = maemoolMarkerArr[i].getTitle().split(",");
					
					if (trObj.children[0].children[0].value ==maemoolObj[0]) {  		/// 마커의 title과 value값이 SEQ값과 같다면  

							var context = "<div><p>"+maemoolObj[0]+"</br>"+maemoolObj[1]+"</br>"+maemoolObj[2]+" "+maemoolObj[3]+"</p></div>";
							infowindow = new google.maps.InfoWindow({
								content : context
							});

							infowindow.open(map, maemoolMarkerArr[i]);

						}
					}
				}
			}
			trObj.style.backgroundColor ="rgb(255,254,213)";
		} else {
			trObj.style.backgroundColor="white";
			infowindow.close();
		}
	}


/////////////////////////////////////////////////////////////////////// article_maemool EVENT 처리 : onclick
/////////////////////////////////////////////////////////////////////// AJAX : Common.java로 SEQ 보내고 받기 
function item_box_click(trObj){
	//alert(trObj.getElementsByTagName('input')[0].value);
	var seq = trObj.getElementsByTagName('input')[0].value;
	alert(seq);
	    $.ajax({
	        url:'common/Ajax.do?'+seq,
	        type:'get',
	        data:"seq="+seq,
	        success: function(responseData){
                var data = responseData.DaumDao;
                if(!data){
                    alert("존재하지 않는 주소입니다");
                    return false;
                }
                alert("ajax 성공! Address 출력-> "+data.address);
           	    var html = '';
                html += '<h1>';
                html += ''+data.seq+'</h1>';
                html += '<h2>';
                html += ''+data.address+'</br>'+'</h2>';
                html += '<h3> close button </h3>';
                html += '<img id="close_button" width="200" src="./images/common/xBox.jpg" onclick="closeButton()" >';
                html += '<a href="#" name="'+seq+'" onclick="jjim(this.name)" ><img id="jjim_button" width="200" src="./images/common/jjim.png"></a>';
                
                $("#article_maemool_detail").html(html);
             
                $("#article_maemool_detail").animate({ marginLeft:w * 1 / 3+85 +'px'});
                $("#maemool_with_option").animate({marginLeft: '100px'});
            }
	    });// end ajax
	   // return false;
}
function closeButton(){
	
    $("#maemool_with_option").animate({marginLeft:  w * 2 / 3+'px'});
	 $("#article_maemool_detail").animate({ marginLeft: w+10+'px'});
     
}

	function loadScript() {
		var script = document.createElement("script");
		script.type = "text/javascript";
		script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyCSmYzxbP4onIPhfbHrbLH_QYbjGKpdGRI&v=3.exp&libraries=places&'
				+ 'callback=initialize';
		document.body.appendChild(script);
	} 
	window.onload = loadScript;
</script>
<script>
	function jjim(seq){
		
		 $.ajax({
		        url:'lovelist/set.do?',
		        type:'post',
		        data:"seq="+seq,
		        success: function(responseData){
	                var data = responseData.DaumDao;
	                if(!data){
	                    alert("존재하지 않는 주소입니다");
	                    return false;
	                }
	                alert("찜");
	            }
		    });
	}
</script>
</head>
<body style="overflow-y : hidden; overflow-x : hidden">
	
	<div class="event_area" style="left:10%; top:200px">
        <input type="image" id="btn_hide" src="./images/common/btn_minus.png" onclick="$('#search_container').hide();$('#btn_show').show();$('#btn_hide').hide();" alt="바로가기 숨기기">
        <input type="image" id="btn_show" src="./images/common/btn_plus.png" onclick="$('#search_container').show();$('#btn_hide').show();$('#btn_show').hide();" alt="바로가기 숨기기">
    </div>
    
	<div id="search_container" >
	 <form name="f">
        <table border="0" width="600" align="center" >
            <tr id="selectSearchType">
                <th align="center" width="150" height="30" id="all"><label class="searchType" id="labelAll"><input type="radio" checked name="searchType" value="all" />전체</label></th>
                <th align="center" width="150" id="maemae"><label class="searchType" id="labelMaemae"><input type="radio" name="searchType" value="maemae" />매매</label></th>
                <th align="center" width="150" id="junse"><label class="searchType" id="labelJunse"><input type="radio" name="searchType" value="junse" />전세</label></th>
                <th align="center" width="150" id="walse"><label class="searchType" id="labelWalse"><input type="radio" name="searchType" value="walse" />월세</label></th>
                <th width="100"></th>
            </tr>
            <tr class="searchSection">
                <td colspan="4" height="60" align="center">
                    <input id="address" type="textbox" placeholder="주소로 검색">
                </td>
                <td rowspan="2">
                    <input type="button" value="SEARCH" onclick="codeAddress()">
                </td>
            </tr>
            <tr class="searchSection">
                <td colspan="4" id="searchChart">
                    검색 순위  &nbsp;&nbsp;
                    <a href="#">아주대 &nbsp;</a>
                    <a href="#">수원역 &nbsp;</a>
                    <a href="#">경기대 &nbsp;</a>
                    <a href="#">인계동 &nbsp;</a>
                    <a href="#">광교</a>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </form>
    
    
	</div>
	
	 <div id="maemool_with_option" style="color:gray; overflow-y:scroll">
        <table >
            <tr height="30px">
                <td>
                    <input type="checkbox" name="checkboxG1" id="checkboxG1" class="css-checkbox"  checked="checked"/>
                    <label for="checkboxG1" class="css-label">매매</label>
                </td>
                <td>
                    <input type="checkbox" name="checkboxG2" id="checkboxG2" class="css-checkbox" checked="checked" />
                    <label for="checkboxG2" class="css-label">전세</label>
                </td>
                <td>
                    <input type="checkbox" name="checkboxG3" id="checkboxG3" class="css-checkbox"  checked="checked"/>
                    <label for="checkboxG3" class="css-label">월세</label>
                </td>
            </tr>
            <tr height="30px">
                <td>
                    <input type="checkbox" name="checkboxG4" id="checkboxG4" class="css-checkbox"/>
                    <label for="checkboxG4" class="css-label">교통</label>
                </td>
                <td>
                    <input type="checkbox" name="checkboxG5" id="checkboxG5" class="css-checkbox"/>
                    <label for="checkboxG5" class="css-label">교육</label>
                </td>
                <td>
                    <input type="checkbox" name="checkboxG6" id="checkboxG6" class="css-checkbox"/>
                    <label for="checkboxG6" class="css-label">의료</label>
                </td>
            </tr>
        </table>
        
       	<table id = "article_maemool">
       		<!-- 매물에 대한 정보  -->
       	</table> 
    
    </div>
	
	<div id="map-container">
		<div id="map-canvas"></div>
	</div>
	   
       	<article id="article_maemool_detail">
       	
		</article>
	
	
</body>
</html>

