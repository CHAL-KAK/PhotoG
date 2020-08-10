<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
</head>
<body>
<div style="margin: 100px 100px 100px 100px">
    	<c:forEach items="${all}" var = "l">
    		<tr>
    			<td>${l.p_id}            </td>
    			<td>${l.start_time}      </td>
    			<td>${l.end_time}        </td>
    			<td>${l.place}           </td>
    			<td>${l.concept}         </td>
    			<td>${l.max}             </td>
    			<td>${l.progress}        </td>
    			<td>${l.day}             </td>
    			<br>
    		</tr>
    	</c:forEach>
    </div>
</body>
</html>