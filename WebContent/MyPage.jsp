<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<script>

function initialize() {

		var userLoveList = [];
		<%String userLoveList = (String) request.getAttribute("userLoveList");
			String[] userLoveListArr = userLoveList.split(",");

			for (int i = 0; i < userLoveListArr.length; i++) {%>
				userLoveList.push("<%=userLoveListArr[i]%>");
		<%}%>
		
		for (var i = 0; i<userLoveList.length; i++) {
			 $.ajax({
			        url:'common/Ajax.do?'+userLoveList[i],
			        type:'get',
			        data:"seq="+userLoveList[i],
			        success: function(responseData){
		                var data = responseData.DaumDao;
		                if(!data){
		                    alert("존재하지 않는 주소입니다");
		                    return false;
		                }
		           	    var html = '';
		                html += '<tr><td><h3>';
		                html += ''+data.seq+'</h3>';
		                html += '<h4>';
		                html += ''+data.address+'</br>'+'</h4>';
		                html += '</td></tr>';
		                
		                $("#loveList").append(html);
		            }
			    });
		}
	}
	
</script>
<body onload="initialize()">
	<table align="center" border="1"  id="loveList">
		<tr><td>찜 목록</td></tr>
	</table>
</body>
</html>