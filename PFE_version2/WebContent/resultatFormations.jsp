<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.*, beans.*" %>
		
		<%
		if(session.getAttribute("loginAdmin") == null){
			response.sendRedirect("login.jsp");
		}
		%>
		
            <c:set var="title" scope="page">Resultat</c:set>

            <!-- header -->
            <%@ include file="inc/includes/header.jsp" %>
                <!-- page content -->
                <div class="right_col" role="main">
                    
                    <div class="row top_tiles">
                    <c:forEach items="${ ResultatDB.getFormation() }" var="elem">
                    	<a href="resultatModules.jsp?formation_id=${ elem.getId() }">
	                    	<div class="animated flipInY" style="display: inline-block; font-size: 15px;">
			                <div class="tile-stats">
			                  <div class="count" style="font-size: 22px;">${ elem.getFormation() } &nbsp;</div>
			                </div>
			              	</div>
		              </a>
                    </c:forEach>
            	  </div>
                    
                </div>
                <!-- /page content -->
                <%@ include file="inc/includes/footer.jsp" %>