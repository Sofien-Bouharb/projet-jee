<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("rooms");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
