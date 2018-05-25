<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.*, beans.Module" %>
		
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
                    <%
                    	List<Module> modulesList= ResultatDB.getModules(Integer.parseInt(request.getParameter("formation_id")));
                    	pageContext.setAttribute("modulesList", modulesList);
                    %>
                    <c:forEach items="${ modulesList }" var="elem">
                    	<a href="resultat.jsp?module_id=${ elem.getId() }">
	                    	<div class="animated flipInY" style="display: inline-block;">
			                <div class="tile-stats">
			                  <div class="count" style="font-size: 22px;">${ elem.getModule() } &nbsp;</div>
			                  <h3 style="font-size: 17px;">Formateur: ${ ModuleDB.getFormateur(elem.getId()).getPrenom() } ${ModuleDB.getFormateur(elem.getId()).getNom() } &nbsp; &nbsp;</h3>
			                  <h3 style="font-size: 17px;">Participants: ${ ResultatDB.count(elem.getId()) }&nbsp; &nbsp;</h3>
			                </div>
			              	</div>
		              </a>
                    </c:forEach>
		             
		              
		              
            	  </div>
                    
                </div>
                <!-- /page content -->
                <%@ include file="inc/includes/footer.jsp" %>