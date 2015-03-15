<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html">
<html>

<%
	
%>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<script src="jquery-1.11.1.min.js "></script>
<script type="text/javascript" src="./js/search.js"></script>

<link rel="stylesheet" href="./style/search.css" type="text/css">


<title>DUMBOs</title>
<style>
a{text-decoration:none;}li{list-style:none;}

#image-container {
	position:relative;
    width: 100%;
    background-color:black;    
}
#image-canvas
{
    width: 100%;
    height: 100%;
    opacity:0.7;
}
</style>

<!-- google . js 에 들어가야 할것 . -->
<script>
var geocoder;
var map;
var first_map;

var x = 0;

var markers = []; // / test

// ///////////////////////////////////////////////////////////////////할것 . -
// > 매물들 임시로 한 20개 정도 위도경도 알아내서 테스트하기 . 지하철역으로 검색하기 만들기 . 매물을 클릭했을때 어떻게
// 나와야될지 고민학

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  											초기화  															//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function initialize() {
	var w =screen.availWidth|| window.innerWidth || document.documentElement.clientWidth
			|| document.body.clientWidth;
	var h =screen.availHeight|| window.innerHeight || document.documentElement.clientHeight
			|| document.body.clientHeight;
	document.getElementById("image-container").style.height = h-110  + 'px';
	document.getElementById("search_container").style.top = h/2  + 'px';


	// //////////////////////////////////////////////////////////////////////////////////////
	// 장소 자동완성 기능

	geocoder = new google.maps.Geocoder();

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

	google.maps.event.addListener(autocomplete, 'place_changed',
			function() {
				document.getElementById("address").value = '';
				var place = autocomplete.getPlace();
				if (!place.geometry) {
					return;
				}
				// If the place has a geometry, then present it on a map.
				if (place.geometry.viewport) {
			} else {
					goAddressAndChangeCSS(place.geometry.location.lat(),place.geometry.location.lng()); // 검색시 바뀌는 CSS !!
				}
				var address = '';

			});

	// //////////////////////////////////////////////////테스트
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
// //////////////////////////////////////////////

// ////////////////////////////////////////////////////////////////////////////////////////////
// 지오 코딩 검색시 !!

function codeAddress() {

	var address = document.getElementById('address').value;
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			goAddressAndChangeCSS(results[0].geometry.location.lat(),results[0].geometry.location.lng()); // 검색시 바뀌는 CSS !!
		} else {
			alert('Geocode was not successful for the following reason: '
					+ status);
		}
	});
}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 주소치면 바뀌는 것 //
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function goAddressAndChangeCSS(lat,lng) {
	document.getElementById("lat").value  = lat;
	document.getElementById("lng").value  = lng;
	$("#locationForm").submit();
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&' +
  'callback=initialize'; document.body.appendChild(script);
}

window.onload=loadScript;
</script>

</head>
<body>

	<div id="image-container">
	<div id="search_container">
	 <form name="f">
        <table border="0" width="600" align="center">
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
                    <a href="#" onclick="goAddressAndChangeCSS(37.28298729999999,127.04624860000001)">아주대 &nbsp;</a>
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

		<img id="image-canvas" src="./images/common/amanda.jpg">
	</div>
	<FORM name="locationForm" id="locationForm" action="item.do" method="post">
		 <INPUT id="lat" type="hidden" value=""name="lat">
		<INPUT id="lng" type="hidden" value=""name="lng">
	</FORM>
</body>
</html>