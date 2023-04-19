<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function(){

		$("#memberUpdateBtn").on("click", function(){
			location.href="memberUpdateView";
		})
		
	})
</script>

<body>
	<h1>My Page</h1>
	
	<h2>한줄평 목록</h2>
	<table>
		<tr>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="rev" items="${collectionRevs}">
			<tr>
				<td><a href="/collection/get?rev_id=${rev.revId}">${rev.revComment}</a></td>
				<td>${rev.replyDate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<h2>게시글 목록</h2>
	<table>
		<tr>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="post" items="${posts}">
			<tr>
				<td><a href="/board/get?post_id=${post.post_id}">${post.post_title}</a></td>
				<td>${post.post_regdate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<h2>댓글 목록</h2>
	<table>
		<tr>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="comment" items="${comments}">
			<tr>
				<td><a href="/board/get?post_id=${comment.post_id}">${comment.com_content}</a></td>
				<td>${comment.com_date}</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<button id="memberUpdateBtn" type="button">회원정보수정</button>
	</div>
</body>
</html>