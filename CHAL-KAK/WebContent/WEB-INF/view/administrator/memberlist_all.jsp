<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<style>
.main{
    
}
 
.main_common{
	margin: 100px 100px 100px 100px;
    /* width: 100px;
    height: 100px; */
    border: 1px solid blue;
}
</style>
</head>
<body>
 
<div class="main">
    <div class="model main_common">
    	<c:forEach items="${model}" var = "m">
    		<tr>
    			<td>
    				<a href="model_mypage.ck?id=${m.m_id}">${m.m_id}</a>
				</td>
    			<td>${m.m_password}      </td>
    			<td>${m.m_name}          </td>
    			<td>${m.m_gender}        </td>
    			<td>${m.m_bday}          </td>
    			<td>${m.m_ka_id}         </td>
    			<td>
    				<a href="deleteModel.ck?seq=${m.model_seq}">delete</a>
    			</td>
    			<br>
    		</tr>
    	</c:forEach>
    </div>
    
    <div class="photographer main_common">
    	<c:forEach items="${photographer}" var = "p">
    		<tr>
    			<td>
    				<a href="photo_mypage.ck?id=${p.p_id}">${p.p_id}</a>
    			</td>
    			<td>${p.p_password}      </td>
    			<td>${p.p_name}          </td>
    			<td>${p.p_gender}        </td>
    			<td>${p.p_bday}          </td>
    			<td>${p.ka_id}           </td>
    			<td>${p.camera_seq}      </td>
    			<td>${p.concept}         </td>
    			<td>${p.career}          </td>
    			<td>${p.url}             </td>
    			<td>
    				<a href="deletePhotographer.ck?seq=${p.photog_seq}">delete</a>
    			</td>
    			<br>
    		</tr>
    	</c:forEach>
    </div>
</div>
</body>
</html>