<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ck.vo.NoticeBoardVO, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeBoard</title>
</head>
<body style="margin: 100px 100px 100px 100px;">
		<%
			List<NoticeBoardVO> Board = (List<NoticeBoardVO>)request.getAttribute("all"); 
			String path = application.getContextPath();
		%>
		<%for (NoticeBoardVO board : Board) {%>
			<!-- out.print(board.getP_id());
			out.print(board.getPlace());
			out.print(board.getConcept());
			out.print(board.getMax());
			out.print(board.getStart_time());
			out.print(board.getEnd_time()); -->
			<tr>
				<td><%=board.getP_id()%></td>
				<td><%=board.getPlace()%></td>
				<td><%=board.getConcept()%></td>
				<td><%=board.getMax()%></td>
				<td><%=board.getStart_time()%></td>
				<td><%=board.getEnd_time()%></td>
				<td>
					<a href="profile.jsp?pid=<%=board.getP_id()%>"> profile </a>&emsp;
					<a href="reserv.jsp?pid=<%=board.getP_id()%>"> reservation </a>
				</td>
			</tr>
			
		<%
			}
		out.print(path);
		%>
		
		<form action="<%=path%>/view/noticeboard/writing.jsp">
			<input type="submit" value="make a list">
			<input type="button" value="back" onclick="location.href='<%=path%>'">
		</form>
	</body>
</html>