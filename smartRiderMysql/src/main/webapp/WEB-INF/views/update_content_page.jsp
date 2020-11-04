<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>게시글 수정</h1>

<form action="./update_content_process.do" method="post">
작성자 : ${data.memberVo.member_nick }<br>
제목 : <input type="text" name="board_title" value="${data.boardVo.board_title }"><br>
내용 : <br>
<textarea name="board_content" rows="5" cols="40">${data.boardVo.board_content }</textarea>

<input type="hidden" name="board_no" value="${data.boardVo.board_no }">

<input type="submit" value="글 수정">


</form>



</body>
</html>













