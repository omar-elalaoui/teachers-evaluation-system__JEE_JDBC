<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.*, beans.*" %>

            <c:set var="title" scope="page">Formateurs</c:set>

            <!-- header -->
            <%@ include file="inc/includes/header.jsp" %>
                <!-- page content -->
                <div class="right_col" role="main">
                    <!-- top tiles -->
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Table des Formateurs</h2>
                            <div class="clearfix"></div>
                        </div>

                        <button type="button" class="btn btn-sm pull-right" data-toggle="modal" data-target="#ajouterFormateur"><i class="fa fa-plus-circle"></i> ajouter formateur</button>

                        <!--  The Modal  Ajouter formateur-->
                        <div class="modal fade" id="ajouterFormateur">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_content">
                                            <br />
                                            <form class="form-horizontal form-label-left input_mask ajouterFF_form" action="AddFormateur">
                                            
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
                                                    <input type="text" maxlength="10" class="form-control inputNumber" name="telephone" placeholder="Téléphone" required>
                                                    <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                                                    
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Specialité <span class="required">*</span></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="text" name="specialite">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Date de naissance</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="date" name="date_naissance">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Genre <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input required type="radio" name="genre" value="Homme"> &nbsp; Homme &nbsp;</label>
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input required type="radio" name="genre" value="Femme"> Femme</label>
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
                        
                        <!--  The Modal  Modifier formateur Profile-->
                        <div class="modal fade" id="modifierProfileModal">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_content">
                                            <br />
                                            <form class="form-horizontal form-label-left input_mask formateurModifierProfile" action="UpdateFormateur">
                                            	
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
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Specialité <span class="required">*</span></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="text" name="specialite">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Date de naissance</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input class="form-control" required="required" type="date" name="date_naissance" >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Genre <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input required type="radio" name="genre" value="Homme"> &nbsp; Homme &nbsp;</label>
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"><input required type="radio" name="genre" value="Femme"> Femme</label>
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
                                                <h4>Formateur Profile</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="boxw box-infow">
                                                    <div class="box-bodyw">
                                                        <div class="col-sm-6">
                                                            <div align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive">
                                                            </div>
                                                            <br>
                                                        </div>
                                                        <div id="formateurProfileAjax">

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

						
                        <!-- The Modal list des Modules-->
                        <div class="modal fade" id="modulesAfficheModal">
                            <div class="modal-dialog modal-xs">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
	                                    <div class="x_title">
	                                    	<br>
	                                        <h2 id="formatuerNomM" class="paddLeftPlus"><!-- Ajax --></h2>
	                                        <div class="clearfix"></div>
	                                    </div>
                                    <br>
                                        <div id="formateurModulesListAjax">

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



                        <!-- The Modal Modifier Modules-->
                        <div class="modal fade" id="modulesModal" role="dialog">
                            <div class="modal-dialog modal-xs">
                                <div class="modal-content">
                                    <div class="modal-body ">
                                        <br>
                                        <form action="AddUpdateFormateurModules" class="formateur_module_modifier_form">
                                        <div class="x_title">
	                                        <h2 id="formateurNomMF" class="paddLeftPlus"><!-- Ajax --></h2>
	                                        <div class="clearfix"></div>
	                                    </div>
                                            <div class="form_content">
                                                <div class="form-group-s">
                                                    <label class="control-label " for="first-name">Modules déjà associés: </label>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div id="affecterChangerModulesAjax">
                                                    
                                                    <!-- Ajax -->

                                                </div>

                                                <br>
                                                <div class="form-group-s">
                                                    <label class="control-label" for="first-name">Modules ajoutés: </label>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <!--Modules ajoutés-->
                                                <div class="modules_ajoutes">
                                                
                                                </div>
                                                <!--fin Modules ajoutés-->

                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label" for="first-name">Ajouter module: </label>
                                                    <div>
                                                    <% 
						                               List<Formation> formationList= new ArrayList<Formation>();
						                               formationList= FormationDB.getAll();
						                               pageContext.setAttribute("formationList", formationList);
						                               %>
                                                        <select class="selectpicker selectFormation form-control" title="--Select--" data-size="6" name="formation_id" onchange='getModulesAjax(1)' multiple>
														  <c:forEach items="${ formationList }" var="elem">
													        <option value="${ elem.getId() }">${ elem.getFormation() }</option>
													      </c:forEach>
														</select>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="form-group">
				                                        <select class="moduleSelect form-control" title="--Select--" data-size="7" name="module_id" multiple>
				                                        
															<!-- Ajax -->
															
														</select>
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


                        <!-- Table-->
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
                                    	List<Formateur> list= new ArrayList<Formateur>();
                                                                list= FormateurDB.getAll();
                                                                pageContext.setAttribute("list", list);
                                    %>
                          			<c:set var="i" scope="page" value="0"></c:set>
                                        <c:forEach items="${ list }" var="elem">
                                            <tr>
                                            <c:set var="i" scope="page" value="${ i + 1 }"></c:set>
                                                <th scope="row">${ i }</th>
                                                <td>${ elem.getPrenom() }</td>
                                                <td>${ elem.getNom() }</td>
                                                <td>${ elem.getEmail() }</td>
                                                <td>
                                                    <a onclick='sendAjax("formateurProfile", ${ elem.getId() })' class="btn btn-success btn-xs" data-toggle="modal" data-target="#profileModal"><i class="fa fa-user"></i> Profile </a>
                                                    <a onclick='sendAjax("formateurModules", ${ elem.getId() })' href="#" class="btn btn-success btn-xs" data-toggle="modal" data-target="#modulesAfficheModal"><i class="fa fa-list-ul"></i> Modules </a>
                                                    <a onclick='getProfileAjax("formateur", ${ elem.getId() })' href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modifierProfileModal"><i class="fa fa-pencil"></i> Modifier Profile</a>
                                                    <a onclick='sendAjax("affecterChangerModules", ${ elem.getId() })' href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modulesModal"><i class="fa fa-pencil"></i> Affecter &#0038; Changer Module</a>
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
