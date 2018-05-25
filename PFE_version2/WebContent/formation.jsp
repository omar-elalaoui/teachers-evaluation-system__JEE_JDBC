<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.FormationDB, beans.Formation" %>

            <c:set var="title" scope="page">Formation</c:set>

            <!-- header -->
            <%@ include file="inc/includes/header.jsp" %>


                <!-- page content -->
                <div class="right_col" role="main">
                    <!-- top tiles -->
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Table des Formations</h2>
                            <div class="clearfix"></div>
                        </div>

                        <button type="button" class="btn btn-secondary btn-sm pull-right" data-toggle="modal" data-target="#ajouterFormateur"><i class="fa fa-plus-circle"></i> Ajouter Formation</button>


                        <!--Modal  Ajouter formation-->
                        <div class="modal fade" id="ajouterFormateur">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" class="form-horizontal formation_form form-label-left ajouterFormation_form" action="AddFormation">
												<!--message de date-->
		                                        <div class="form-group date_alert">
		                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
		                                            <div class="alert alert-danger alert_small">
		                                                <strong>Ops!</strong>La date de fin avant la date de début
		                                            </div>
		                                        </div>
		                                        <!--fin message de date-->
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Formation <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" name='formation' required class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 " for="first-name">Volume horaire <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" name='duree' required class="form-control col-md-7 col-xs-12 inputNumber">
                                                        <b><span class=" form-control-feedback right" aria-hidden="true">H</span></b>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Date de début <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="date" name='date_debut' required class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Date de fin <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="date" name='date_fin' required class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Modules </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div class="input-group">
                                                            <input type="text" name='module' required class="form-control">
                                                            <span class="input-group-btn">
                                                              <button type="button" class="btn btn-default add"><i class="fa fa-plus"></i></button>
                                                            </span>
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

						
						<!--Modal  Modifier formation-->
                        <div class="modal fade" id="modifierF">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" class="formationModifier form-horizontal formation_form form-label-left mm_form" action="UpdateFormation">
												<!--message de date-->
												<input type="text" style='display:none;' name="id">
		                                        <div class="form-group date_alert">
		                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
		                                            <div class="alert alert-danger alert_small">
		                                                <strong>Ops!</strong>La date de fin avant la date de début
		                                            </div>
		                                        </div>
		                                        <!--fin message de date-->
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Formation <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" name='formation' readonly class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12 " for="first-name">Volume horaire <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" name='duree' required class="form-control col-md-7 col-xs-12 inputNumber">
                                                        <b><span class=" form-control-feedback right" aria-hidden="true">H</span></b>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Date de début <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="date" name='date_debut' required class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Date de fin <span class="required">*</span></label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="date" name='date_fin' required class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Modules </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 modulesBB">
                                                        <div class="input-group ">
                                                            <input type="text" name='module' required class="form-control">
                                                            <span class="input-group-btn ">
                                                              <button type="button" class="btn btn-default add"><i class="fa fa-plus"></i></button>
                                                            </span>
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
						
						
                        <!--Modal Plus-->
                        <div class="modal fade" id="plusModal">
                            <div class="modal-dialog modal-ssm">
                                <div class="modal-content">
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="x_panel no_border">
                                            <div class="x_title">
                                                <h2 id="formationTitre"><!-- Ajax --></h2>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <br>

                                                <div id="formationPlusBody">

                                                    <!-- Ajax-->

                                                </div>
                                                <div class="button-list">
                                                    <button type="button" class="btn btn-default pull-left" data-toggle="modal" data-target="#tableModules">List des modules &nbsp;<i class="fa fa-file-text"></i></button>
                                                    <button type="button" class="btn btn-default pull-left" data-toggle="modal" data-target="#tableFormateurs">List des formateurs &nbsp;<i class="fa fa-file-text"></i></button>
                                                    <button type="button" class="btn btn-default pull-left" data-toggle="modal" data-target="#tableFormes">List des participants &nbsp;<i class="fa fa-file-text"></i></button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fermer</button>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!--Modal List des Modules-->
                            <div class="modal fade" id="tableModules">
                                <div class="modal-dialog modal-xs">
                                    <div class="modal-content">
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                           <div id="listModules">
                                              
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


                            <!--Modal List des Formateurs-->
                            <div class="modal fade" id="tableFormateurs">
                                <div class="modal-dialog modal-ssm">
                                    <div class="modal-content">
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>List des formateurs :</h2>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <br>
                                                <div class="x_content fontPlus">
                                                    <table class="table table-hover tt">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Prénom</th>
                                                                <th>Nom</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="formateursTableBody">

                                                            <!-- Ajax -->

                                                        </tbody>
                                                    </table>

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


                            <!--Modal List des Formés-->
                            <div class="modal fade" id="tableFormes">
                                <div class="modal-dialog modal-ssm">
                                    <div class="modal-content">
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>List des participants :</h2>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <br>
                                                <div class="x_content fontPlus">
                                                    <table class="table table-hover tt">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Prénom</th>
                                                                <th>Nom</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="formesTableBody">

                                                            <!-- Ajax-->

                                                        </tbody>
                                                    </table>

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


                            <!-- Table-->
                            <div class="x_content">
                                <table id="datatable" class="table table-striped table-bordered tt">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Formation</th>
                                            <th>Date de début</th>
                                            <th>Date de fin</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <% 
                               List<Formation> formationList= new ArrayList<Formation>();
                               formationList= FormationDB.getAll();
                               session.setAttribute("formationList", formationList);
                               %>
                               			<c:set var="i" scope="page" value="0"></c:set>
                                            <c:forEach items="${ formationList }" var="elem">
                                                <tr>
                                                	<c:set var="i" scope="page" value="${ i + 1 }"></c:set>
                                                    <th scope="row">${ i }</th>
                                                    <td>${ elem.getFormation() }</td>
                                                    <td>${ elem.getDate_debut() }</td>
                                                    <td>${ elem.getDate_fin() }</td>
                                                    <td>
                                                        <a href="#" onclick='sendAjax("formationPlus", ${ elem.getId() })' class="btn btn-primary btn-xs" data-toggle="modal" data-target="#plusModal"><i class="fa fa-align-justify"></i> Plus </a>
                                                        <a href="#" onclick='getProfileAjax("formation", ${ elem.getId() })' class="btn btn-info btn-xs" data-toggle="modal" data-target="#modifierF"><i class="fa fa-pencil"></i> Modifier </a>
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
