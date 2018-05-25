<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.AssistantDB,beans.User" %>
<%
	if(session.getAttribute("loginAdmin") == null){
	response.sendRedirect("login.jsp");
		}
%>
            <c:set var="title" scope="page">Assistant</c:set>

            <!-- header -->
            <%@ include file="inc/includes/header.jsp" %>
                <!-- page content -->
                <div class="right_col" role="main">
                    <!-- top tiles -->

                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Compte assistant </h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />

                            <c:choose>
                            
                            	
                                <c:when test="${ AssistantDB.isCreated() }">
                                	<%
                                		User u= AssistantDB.get();
                                	    pageContext.setAttribute("u", u);
                                	%>
                                					<c:if test="${ pwdSent }">
                                						<div id="b-alert">
                                							<div class="alert alert-success">
															  Le mot de passe a été envoyé à <strong>${ pageScope.u.getuserEmail() }</strong> avec succès.
															</div>
                                						</div>
														<c:set var="pwdSent" scope="session" value="false"/>
													</c:if>
                                    <form class="form-horizontal assistant_data" style="font-size: 110%;">
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="email">Mail de votre assistant: </label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${ pageScope.u.getuserEmail() }</p>
                                            </div>
                                        </div><br>
                                        <a href="#" class="text-danger" data-toggle="modal" data-target="#modifierAssistant">Modifier les paramètres d'accès ?</a><br>
                                        <a href="SuppAssistantCompte" class="text-danger">Supprimer le compte ?</a>
                                    </form><br><br><br><br>
                                    
                                    <form action="SendTask" method="post">
                                        <div class="form-group" id="b-alert">
                                        			<c:if test="${ messageSent }">
										                <div class="alert alert-success">
															  <strong>succès!</strong> Le message a été envoyé avec succès.
														</div>
														<c:set var="messageSent" scope="session" value="false"/>
													</c:if>
                                            
                                             <label class="control-label col-md-12">Envoyer une tâche à l'assistant :</label><br>
                                             <div class="row">
                                             	<div class="col-md-5">
                                                	<textarea class="form-control" rows="3" cols="21" placeholder="Message" name="message" required></textarea>
                                             	</div>
                                             </div>
                                          </div>
                                          <button type="submit" class="btn btn-info">Envoyer <i class="fa fa-share"></i></button>
                                    </form>
                                </c:when>
                                
                                
                                <c:when test="${ !AssistantDB.isCreated() }">
                                    <form id="demo-form2" class="form-horizontal form-label-left assistant_form" style="display: nofne;" action="CreerAssistant">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Email <span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="email" name="email" value="" required class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">mot de passe <span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="password" name="pwd1" required class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Confirmer mot de passe <span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="password" name="pwd2" required class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <!--message de mot de pass-->
                                        <div class="form-group pwd_alert">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                            <div class="alert alert-danger alert_small">
                                                <strong>Oops!</strong> Les deux champs de mot de passe ne correspondent pas !!
                                            </div>
                                        </div>
                                        <!--fin message de mot de pass-->
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button class="btn btn-primary" type="reset">Réinitialiser</button>
                                                <button type="submit" class="btn btn-success">Enregistrer</button>
                                            </div>
                                        </div>

                                    </form>
                                </c:when>
                                
                            </c:choose>

							
							<!--Modal  modifier le compte assistant-->
                        <div class="modal fade" id="modifierAssistant">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" class="form-horizontal form-label-left assistant_form" style="display: nofne;" action="CreerAssistant">
		                                        <!--message de mot de pass-->
		                                        <div class="form-group pwd_alert text-center">
		                                            <div class="alert alert-danger alert_small ">
		                                                <strong>Oops!</strong> Les deux champs de mot de passe ne correspondent pas !!
		                                            </div>
		                                        </div>
		                                        <!--fin message de mot de pass-->
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 col-sm-4  col-xs-12" for="last-name">Email <span class="required">*</span></label>
		                                            <div class="col-md-6 col-sm-6 col-xs-12">
		                                                <input type="email" name="email" value="${ pageScope.u.getuserEmail() }" required class="form-control col-md-7 col-xs-12">
		                                            </div>
		                                        </div>
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 col-sm-4  col-xs-12" for="last-name">mot de passe <span class="required">*</span></label>
		                                            <div class="col-md-6 col-sm-6 col-xs-12">
		                                                <input type="password" name="pwd1" required class="form-control col-md-7 col-xs-12">
		                                            </div>
		                                        </div>
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 col-sm-4 col-xs-12" for="last-name">Confirmer mot de passe <span class="required">*</span></label>
		                                            <div class="col-md-6 col-sm-6 col-xs-12">
		                                                <input type="password" name="pwd2" required class="form-control col-md-7 col-xs-12">
		                                            </div>
		                                        </div>
		                                        <div class="ln_solid"></div>
		                                        <div class="form-group">
		                                            <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-3">
		                                                <button class="btn btn-primary" type="reset">Réinitialiser</button>
		                                                <button type="submit" class="btn btn-success">Enregistrer</button>
		                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Fermer</button>
		                                            </div>
		                                        </div>
                                    		</form>
                                        </div>
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer"></div>
                                </div>
                            </div>
                        </div>
							
                        </div>
                    </div>
                    <!-- /top tiles -->

                    <br />
                </div>
                <!-- /page content -->
                <%@ include file="inc/includes/footer.jsp" %>
