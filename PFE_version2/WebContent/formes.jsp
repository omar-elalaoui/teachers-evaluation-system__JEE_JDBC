<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.*, beans.*" %>

            <c:set var="title" scope="page">Formés</c:set>

            <!-- header -->
            <%@ include file="inc/includes/header.jsp" %>
                <!-- page content -->
                <div class="right_col" role="main">
                    <!-- top tiles -->
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Table des Participants</h2>
                            <div class="clearfix"></div>
                        </div>


					
					
                        <!-- + Ajouter Formé-->
                        <button type="button" class="btn btn-secondary btn-sm pull-right" data-toggle="modal" data-target="#ajouterFormateur"><i class="fa fa-plus-circle"></i> ajouter un Participant</button>

                        <!-- The Modal  Ajouter formé-->
                        <div class="modal fade" id="ajouterFormateur">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_content">
                                            <br />
                                            <form class="form-horizontal form-label-left input_mask ajouterFF_form" action="AddForme">
                                            
                                            	<!--message alert-->
			                                        <div class="form-group message_alert text-center">
			                                            <div class="alert alert-danger alert_small"> </div>
			                                        </div>
			                                    <!--fin message alert-->
			                                        
                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="text" class="form-control has-feedback-left" name="prenom" placeholder="Prénom" required>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>

                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="text" class="form-control" name="nom" placeholder="Nom">
                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                                </div>

                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="email" class="form-control has-feedback-left" name="email" placeholder="Email" required>
                                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                                                </div>

                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="tel" class="form-control inputNumber" name="telephone" placeholder="Téléphone" required>
                                                    <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Date de naissance <span class="required">*</span></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="date" name="date_naissance">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">CIN </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="text" name="cin">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Genre <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input type="radio" name="genre" value="male" required> &nbsp; Homme &nbsp;</label>
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input type="radio" name="genre" value="female" required> Femme</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-success">Enregistrer</button>
                                                    <button type="button" class="btn btn-dark" data-dismiss="modal">Fermer</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer"></div>
                                </div>
                            </div>
                        </div>
	
						 <!-- The Modal Modifier Profile formé-->
                        <div class="modal fade" id="modifierProfileModal">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_content">
                                            <br />
                                            <form class="form-horizontal form-label-left input_mask formeModifierProfile" action="UpdateForme">
                                            
	                                            <!--message alert-->
			                                        <div class="form-group message_alert text-center">
			                                            <div class="alert alert-danger alert_small"> </div>
			                                        </div>
			                                    <!--fin message alert-->
			                                    
												<input type="text" style='display:none;' name="id">
                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="text" class="form-control has-feedback-left" name="prenom" placeholder="Prénom" required>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>

                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="text" class="form-control" name="nom" placeholder="Nom">
                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                                </div>

                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="email" class="form-control has-feedback-left" name="email" placeholder="Email" required>
                                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                                                </div>

                                                <div class="col-md-6 col-sm-6  form-group has-feedback">
                                                    <input type="tel" class="form-control inputNumber" name="telephone" placeholder="Téléphone" required>
                                                    <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Date de naissance <span class="required">*</span></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="date" name="date_naissance">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">CIN </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="text" name="cin">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Genre <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input type="radio" name="genre" value="male" required> &nbsp; Homme &nbsp;</label>
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input type="radio" name="genre" value="female" required> Femme</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-success">Enregistrer</button>
                                                    <button type="button" class="btn btn-dark" data-dismiss="modal">Fermer</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer"></div>
                                </div>
                            </div>
                        </div>
			
                        <!-- The Modal Profile-->
                        <div class="modal fade" id="profileModal">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4>Participant Profile</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="boxw box-infow">
                                                    <div class="box-bodyw">
                                                        <div class="col-sm-6">
                                                            <div align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive">
                                                            </div>
                                                            <br>
                                                        </div>

                                                        <div id="formeProfileAjax">

                                                            <!-- Ajax -->

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer no_border">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Fermer</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- The Modal afficher Formations-->
                        <div class="modal fade" id="formationsAfficheModal" role="dialog">
                            <div class="modal-dialog modal-xs">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        
                                        <div id="formeFormationsAjax">
                                            
                                            <!-- Ajax -->
                                            
                                        </div>
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer no_border">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Fermer</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- The Modal Modifier Formations-->
                        <div class="modal fade" id="formationsModifierModal" role="dialog">
                            <div class="modal-dialog modal-xs">
                                <div class="modal-content">
                                    <div class="modal-body ">
                                        <br>
                                        <form action="AddUpdateFormationForme" class="forme_module_modifier_form ">
                                        	
                                        	<div class="x_title">
                                                <h2 id="formeNom" class="paddLeftPlus"><!-- Ajax --></h2>
                                                <div class="clearfix"></div>
                                            </div>
                                        
                                            <div class="form_content">                                            
                                            <div class="form-group-s">
                                                    <label class="control-label " for="first-name">Formations déjà associés: </label>
                                                    <div class="clearfix"></div>
                                             </div>
                                                <div id="affecterChangerFormationsAjax">
                                                    
                                                    <!-- Ajax -->

                                                </div>
                                                <br>
                                                <div class="form-group-s">
                                                    <label class="control-label" for="first-name">Formations ajoutés: </label>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <!--Formations ajoutés-->
                                                <div class="formation_ajoutes">

                                                </div>
                                                <!--fin Formations ajoutés-->

                                                <br>
                                                <div class="form-group">
                                                    <div>
                                                    <% 
						                               List<Formation> formationList= new ArrayList<Formation>();
						                               formationList= FormationDB.getAll();
						                               pageContext.setAttribute("formationList", formationList);
						                               %>
                                                        <label class="control-label" for="first-name">Ajouter Formation: </label>
                                                        <select class="selectpicker selectFormation form-control" title="--Select--" data-size="6" name="formation_id" multiple>
														  <c:forEach items="${ formationList }" var="elem">
													        <option value="${ elem.getId() }">${ elem.getFormation() }</option>
													      </c:forEach>
														</select>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="modal-footer no_border">
                                                <button type="submit" class="btn btn-success">Enregistrer</button>
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Fermer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Table -->
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered tt">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Prénom</th>
                                        <th>Nom</th>
                                        <th>Email</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                    	List<Forme> list= new ArrayList<Forme>();
                                                                    list= FormeDB.getAll();
                                                                    pageContext.setAttribute("list", list);
                                    %>
										<c:set var="i" value="0" scope="page"></c:set>
                                        <c:forEach items="${ list }" var="elem">
                                            <tr>
                                            <c:set var="i" scope="page" value="${ i + 1 }"></c:set>
                                                <th scope="row">${ i }</th>
                                                <td>${ elem.getPrenom() }</td>
                                                <td>${ elem.getNom() }</td>
                                                <td>${ elem.getEmail() }</td>
                                                <td>
                                                    <a onclick='sendAjax("formeProfile", ${ elem.getId() })' href="#" class="btn btn-success btn-xs" data-toggle="modal" data-target="#profileModal"><i class="fa fa-user"></i> Profile </a>
                                                    <a onclick='sendAjax("formeFormations", ${ elem.getId() })'href="#" class="btn btn-success btn-xs" data-toggle="modal" data-target="#formationsAfficheModal"><i class="fa fa-list-ul"></i> Formations </a>
                                                    <a onclick='getProfileAjax("forme", ${ elem.getId() })' href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modifierProfileModal"><i class="fa fa-pencil"></i> Modifier Profile</a>
                                                    <a onclick='sendAjax("affecterChangerFormations", ${ elem.getId() })' href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#formationsModifierModal"><i class="fa fa-pencil"></i> Affecter &#0038; Changer Formation</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
                <%@ include file="inc/includes/footer.jsp" %>
