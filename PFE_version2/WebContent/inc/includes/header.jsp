<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Map, java.util.HashMap,dao.MessageDB" %>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

if(session.getAttribute("loginAdmin") == null && session.getAttribute("loginAssistant") == null){
			response.sendRedirect("login.jsp");
		}
%>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>${ title }</title>
    <link rel="stylesheet" href="inc/css/bootstrap.css" >
    <link rel="stylesheet" href="inc/css/bootstrap-select.min.css" >
    <link rel="stylesheet" href="inc/css/font-awesome.min.css" >
    <link rel="stylesheet" href="inc/css/custom.min.css" >
    <link rel="stylesheet" href="inc/flat/green.css">
    <link rel="stylesheet" href="inc/css/style.css" >
</head>

<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="clearfix"></div>

                    <!-- menu profile quick info -->
                    <div class="profile clearfix">
                        <div class="profile_pic">
                            <img src="inc/images/user.png" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>Bienvenue,</span>
                            <c:if test="${ sessionScope.loginAdmin != null }">
	                                <h2>Administrateur</h2>
                            </c:if>
                            <c:if test="${ sessionScope.loginAssistant != null }">
	                                <h2>Assistant</h2>
                            </c:if>
                        </div>
                    </div>
                    <br>
                    <!-- /menu profile quick info -->
                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a href="accueil.jsp"><i class="fa fa-home"></i> Accueil </a></li>
                                
                                <c:if test="${ sessionScope.loginAdmin != null }">
                                     <li><a href="assistant.jsp"><i class="fa fa-user"></i> Compte assistant </a></li>
                                </c:if>
                                
                                
                                <li><a href="formateurs.jsp"><i class="fa fa-users"></i> Formateurs </a></li>
                                <li><a href="formes.jsp"><i class="fa fa-male"></i> Participants </a></li>
                                <li><a href="formation.jsp"><i class="fa fa-mortar-board"></i> Formations </a></li>
                                
                                <c:if test="${ sessionScope.loginAdmin != null }">
	                                <li><a href="evaluation.jsp"><i class="fa fa-file-text-o"></i> Evaluation </a></li>
	                                <li><a href="resultatFormations.jsp"><i class="fa fa-newspaper-o"></i> Resultat </a></li>
                                </c:if>
                            </ul>
                        </div>

                    </div>
                    <!-- /sidebar menu -->
                </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    				<img src="inc/images/user.png" alt=""> 
	                                Administrateur
                    					<span class=" fa fa-angle-down"></span>
                  				</a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="LogoutServlet"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                                </ul>
                            </li>
					<c:if test="${ sessionScope.loginAssistant != null }">
                            <li role="presentation" class="dropdown" onclick="notif()">
                                 <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
				                    <i class="fa fa-envelope-o"></i>
				                    
				                    <c:if test="${ MessageDB.newCount()!=0 }">
				                    	<span class="badge bg-green notif">${ MessageDB.newCount() }</span>
				                    </c:if>
				                  </a>
                                <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                    <c:forEach items="${ MessageDB.getAll() }" var="message">
                                    			<li>
			                                        <a>
								                        <span class="message">
								                        <span class="time">3 mins</span><br>
								                          <span style="font-size: 110%;"> ${ message } </span>
								                        </span>
								                      </a>
			                                    </li>
                                    </c:forEach>
                                </ul>
                            </li>
                           </c:if>
                        </ul>
                    </nav>
                </div>
            </div>