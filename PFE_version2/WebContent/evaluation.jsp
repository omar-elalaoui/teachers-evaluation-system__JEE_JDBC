<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.*, beans.Formation, beans.Forme, beans.Module" %>

            <%
				if(session.getAttribute("loginAdmin") == null){
					response.sendRedirect("login.jsp");
				}
			%>
                <c:set var="title" scope="page">Evaluation</c:set>
                <!-- header -->
                <%@ include file="inc/includes/header.jsp" %>


                    <!-- page content -->
                    <div class="right_col" role="main">

                        <form action="EvaluationListFormes">
                            <div class="form-group">
                                <div>
                                    <% 
	                                 List<Formation> formationList= new ArrayList<Formation>();
	                                 formationList= FormationDB.getAll();
	                                 pageContext.setAttribute("formationList", formationList);
	                                 %>
                                    <select class="selectpicker selectFormation " title="--Formation--" data-size="6" name="formation_id" onchange='getModulesAjax(2)' multiple>
									  <c:forEach items="${ formationList }" var="elem">
								        <option value="${ elem.getId() }">${ elem.getFormation() }</option>
								      </c:forEach>
									</select>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="form-group">
                                <select class="moduleSelect " title="--Modules--" data-size="7" name="module_id" multiple>
                                
									<!-- Ajax -->
			
							</select>
                                <div class="clearfix"></div>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-info" type="submit">Afficher la liste des formés</button>
                                <div class="clearfix"></div>
                            </div><br><br><br><br>
                            <c:if test="${ emailSent }">
				                <div id="b-alert">
				                	<div class="alert alert-success fontPlus">
									  <strong>succès!</strong>Le lien du formulaire a été envoyé avec succès.
									</div>
				                </div>
								<c:set var="emailSent" scope="session" value="false"/>
							</c:if>
                        </form>
                        
                        <form action="MailSender">
                        
                        	<%
                        	if(request.getAttribute("modulesList") != null){
                        	%>
                        		<c:forEach items="${ modulesList }" var="elem">
                        				<input type="text" value="${ elem }" name="module_id" hidden=hidden>
                        		</c:forEach>
                        	<%}%>
                        	
							<div class="table-responsive evaluationFormesTable" <% if(request.getAttribute("formeList") == null){%> hidden=hidden <%} %>>
							<button type="submit" class="btn btn-warning">Envoyer Email <i class="fa fa-share"></i></button>
                                    <table class="table table-striped jambo_table bulk_action">
                                        <thead>
                                            <tr>
                                                <th>
                                                    
                                                </th>
                                                <th>Prénom</th>
                                                <th>Nom</th>
                                                <th>Email</th>
                                                <th>Telephone</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${ requestScope.formeList }" var="elem">
                                                <tr>
                                                    <td class="a-center ">
                                                        <input checked type="checkbox" class="flat" name="forme_id" value="${ elem.getId() }">
                                                    </td>
                                                    <td>${ elem.getPrenom() }</td>
                                                    <td>${ elem.getNom() }</td>
                                                    <td>${ elem.getEmail() }</td>
                                                    <td>
                                                        ${ elem.getTelephone() }
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

						</form>


                        <div >
                            <div class="x_panel" <% if(request.getAttribute("formeList") != null){%> style="display: none;" <%} %>>
                                <div class="x_title" >
                                    <h2>Evaluation</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content" >
                                    <form action="">
                                        <h3 class="text-warning" >La formation :</h3>
                                        <h4>#1 Dans cette formation j'ai appris </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Beaucoup" name="formation_q1">Beaucoup</label>
                                            <label class="radio"><input type="radio" value="Moyennement" name="formation_q1">Moyennement</label>
                                            <label class="radio"><input type="radio" value="Un peu" name="formation_q1">Un peu</label>
                                            <label class="radio"><input type="radio" value="Rien" name="formation_q1">Rien</label>
                                        </div>
                                        <h4>#2 Le contenu de la formation correspondait à mes besoins </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="formation_q2">Oui </label>
                                            <label class="radio"><input type="radio" value="plus ou moins" name="formation_q2">plus ou moins</label>
                                            <label class="radio"><input type="radio" value="Non" name="formation_q2">Non </label>
                                        </div>
                                        <h4>#3 De façon général, les séances se déroulent dans de bonnes conditions </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="formation_q3">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="formation_q3">Non </label>
                                            <label class="radio"><input type="radio" value="Parfois" name="formation_q3">Parfois </label>
                                        </div>
                                        <hr>

                                        <h3 class="text-warning">La Communication :</h3>
                                        <h4  >#1 Le formateur communiquait d’une façon claire et dynamique </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="communication_q1">Oui </label>
                                            <label class="radio"><input type="radio" value="plus ou moins" name="communication_q1">plus ou moins</label>
                                            <label class="radio"><input type="radio" value="Non" name="communication_q1">Non </label>
                                        </div>

                                        <h4>#2 Le formateur utilise une langue dans ses échanges verbaux </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Bonne" name="communication_q2">Bonne </label>
                                            <label class="radio"><input type="radio" value="Moyenne" name="communication_q2">Moyenne </label>
                                            <label class="radio"><input type="radio" value="Mauvaise" name="communication_q2">Mauvaise </label>
                                        </div>
                                        <h4>#3 Le formateur utilise une langue à l'écrit </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Bonne" name="communication_q3">Bonne </label>
                                            <label class="radio"><input type="radio" value="Moyenne" name="communication_q3">Moyenne </label>
                                            <label class="radio"><input type="radio" value="Mauvaise" name="communication_q3">Mauvaise </label>
                                        </div>
                                        <h4>#4 Le formateur fait preuve de disponibilité et offre son soutien au participants</h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="communication_q4">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="communication_q4">Non </label>
                                        </div>
                                        <hr>
                                        <h3 class="text-warning">L'enseignement :</h3>
                                        <h4>#1 Le formateur a respecté le rythme d’apprentissage des participants </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q1">Oui </label>
                                            <label class="radio"><input type="radio" value="plus ou moins" name="enseignement_q1">plus ou moins</label>
                                            <label class="radio"><input type="radio" value="Non" name="enseignement_q1">Non </label>
                                        </div>
                                        <h4>#2 Les techniques d’enseignement ont favorisé l’apprentissage </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q2">Oui </label>
                                            <label class="radio"><input type="radio" value="plus ou moins" name="enseignement_q2">plus ou moins</label>
                                            <label class="radio"><input type="radio" value="Non" name="enseignement_q2">Non </label>
                                        </div>

                                        <h4>#3 Le formateur utilise des ressources didactiques variées et appropriées </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q3">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="enseignement_q3">Non </label>
                                        </div>
                                        <h4>#4 Le contenus et le programme de la formation est respecté </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q4">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="enseignement_q4">Non </label>
                                        </div>
                                        <hr>
                                        <h3 class="text-warning" >L'evaluation :</h3>
                                        <h4>#1 Le formateur choisit des instruments d'évaluation pertinents au regard des objectifs poursuivis </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="evaluation_q1">Oui </label>
                                            <label class="radio"><input type="radio" value="plus ou moins" name="evaluation_q1">plus ou moins</label>
                                            <label class="radio"><input type="radio" value="Non" name="evaluation_q1">Non </label>
                                        </div>

                                        <h4>#2 Le Formateur utilise des moyens variés pour évlauer les apprentissages des participants (tests, travaux partiques ...) </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="evaluation_q2">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="evaluation_q2">Non </label>
                                        </div>
                                        <h4>#3 Les évaluations sont généralement de niveau </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Trop difficile" name="evaluation_q3">Trop difficile </label>
                                            <label class="radio"><input type="radio" value="difficile" name="evaluation_q3">difficile </label>
                                            <label class="radio"><input type="radio" value="Equilibré" name="evaluation_q3">Equilibré</label>
                                            <label class="radio"><input type="radio" value="Moyen" name="evaluation_q3">Moyen </label>
                                            <label class="radio"><input type="radio" value="Facile" name="evaluation_q3">Facile</label>
                                        </div>

                                        <h4 >#4 Le formateur utilise les résultats de l'évaluation pour détecter certaines difficultés, determiner les causes et proposer des activités correctives </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="evaluation_q4">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="evaluation_q4">Non </label>
                                        </div>
                                        <hr>
                                        <h3 class="text-warning" >Techniques :</h3>
                                        <h4>#1 Le formateur emploie les diagrammes, les illustartions, les video ...</h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="techniques_q1">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="techniques_q1">Non </label>
                                        </div>
                                        <h4>#2 Le formateur emploie les nouvelles technologies (pc, projecteur ...) </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="techniques_q2">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="techniques_q2">Non </label>
                                        </div>
                                        <h4>#3 le formateur met ses cours à disponibilité des participants par internet </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui" name="techniques_q3">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="techniques_q3">Non </label>
                                        </div>
                                        <hr>
                                        <h3 class="text-warning" >Autres qualités professionelles :</h3>
                                        <h4>#1 Le formateur métrise les propos de la formation </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Beaucoup" name="autres_q1">Beaucoup </label>
                                            <label class="radio"><input type="radio" value="Moyennement" name="autres_q1">Moyennement </label>
                                            <label class="radio"><input type="radio" value="Un peu" name="autres_q1">Un peu</label>
                                        </div>
                                        <h4>#2 Le formateur prépare un cours comprehensible </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui " name="autres_q2">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="autres_q2">Non </label>
                                        </div>
                                        <h4>#3 Le formateur prépare un cours realiste et qui respecte la durée de la formation</h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui " name="autres_q3">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="autres_q3">Non </label>
                                        </div>
                                        <h4>#4 Le formateur prends en compte les nouvelles notions qui changent ou s'ajoute en cours </h4>
                                        <div class="radios">
                                            <label class="radio"><input type="radio" value="Oui " name="autres_q4">Oui </label>
                                            <label class="radio"><input type="radio" value="Non" name="autres_q4">Non </label>
                                        </div>
                                        <hr>
                                        <div class="form-group">
                                            <label for="ta">Ajouter un commentaire</label>
                                            <textarea class="form-control" id="ta" rows="3" name="commentaire"></textarea>
                                        </div>
                                        <br>
                                    </form>


                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /page content -->
                    <%@ include file="inc/includes/footer.jsp" %>
