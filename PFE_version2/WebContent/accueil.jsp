<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.*, beans.*" %>

            <c:set var="title" scope="page">Accueil</c:set>

            <!-- header -->
            <%@ include file="inc/includes/header.jsp" %>
                <!-- page content -->
                <div class="right_col" role="main">
                    
                    <div class="row top_tiles">
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-mortar-board"></i></div>
                  <div class="count">${ FormationDB.getCount() }</div>
                  <h3>Formations</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-users"></i></div>
                  <div class="count">${ FormateurDB.getCount() }</div>
                  <h3>Formateurs</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-male"></i></div>
                  <div class="count">${ FormeDB.getCount() }</div>
                  <h3>Participants</h3>
                </div>
              </div>
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"><i class="fa fa-newspaper-o"></i></div>
                  <div class="count">${ ModuleDB.getCount() }</div>
                  <h3>Modules</h3>
                </div>
              </div>
            </div>
                    
                </div>
                <!-- /page content -->
            <%@ include file="inc/includes/footer.jsp" %>
