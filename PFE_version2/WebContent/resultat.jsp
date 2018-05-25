<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page import="java.util.*,dao.FormationDB, dao.ResultatDB, beans.Formation, beans.Resultat" %>

<%
		if(session.getAttribute("loginAdmin") == null){
			response.sendRedirect("login.jsp");
		}
%>
            <c:set var="title" scope="page">Resultat</c:set>
            <%@ include file="inc/includes/header.jsp" %>
            
            
			<!-- page content -->
			<div class="right_col rs" role="main">
					
					<form action="ValiderFormulaire" style="margin-left:50px;">
						<div class="clearfix"></div>
						<br>
								  <% 
								  	int m_id= Integer.parseInt(request.getParameter("module_id")); 
								  	pageContext.setAttribute("m_id", m_id); 
								  %>
                        <h3>La formation</h3>
                        <h4>#1 Dans cette formation j'ai appris </h4>
							 <div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar"
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q1", "Beaucoup", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Beaucoup (<%out.print(String.format("%.0f", (float)ResultatDB.getNombre_Reponses("q1", "Beaucoup", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								    
								  </div>
								  <div class="progress-bar progress-bar-info" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q1", "Moyennement", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Moyennement (<%out.print(String.format("%.0f", (float)ResultatDB.getNombre_Reponses("q1", "Moyennement", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
								  <div class="progress-bar progress-bar-warning" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q1", "Un peu", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Un peu (<%out.print(String.format("%.0f", (float)ResultatDB.getNombre_Reponses("q1", "Un peu", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
								  <div class="progress-bar progress-bar-danger" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q1", "Rien", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Rien (<%out.print(String.format("%.0f", (float)ResultatDB.getNombre_Reponses("q1", "Rien", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
							 </div>
							
                        <h4>#2 Le contenu de la formation correspondait à mes besoins </h4>
                        	<div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar"
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q2", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Oui (<%out.print(String.format("%.0f", (float)ResultatDB.getNombre_Reponses("q2", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								    
								  </div>
								  <div class="progress-bar progress-bar-info" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q2", "plus ou moins", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    plus ou moins (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q2", "plus ou moins", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
								  <div class="progress-bar progress-bar-warning" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q2", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q2", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
							 </div>
                        <h4>#3 De façon général, les séances se déroulent dans de bonnes conditions </h4>
                                
                                <div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar"
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q3", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q3", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								    
								  </div>
								  <div class="progress-bar progress-bar-info" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q3", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q3", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
								  <div class="progress-bar progress-bar-warning" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q3", "Parfois", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Parfois (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q3", "Parfois", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
							 </div>
                        <hr>

                        <h3>La Communication</h3>
                        <h4>#1 Le formateur communiquait d'une façon claire et dynamique </h4>
                                
                                <div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar"
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q4", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q4", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								    
								  </div>
								  <div class="progress-bar progress-bar-info" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q4", "plus ou moins", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    plus ou moins (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q4", "plus ou moins", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
								  <div class="progress-bar progress-bar-warning" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q4", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q4", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
							 </div>

                        <h4>#2 Le formateur utilise une langue dans ses échanges verbaux </h4>
                                    
                                    <div class="progress">
                                          <div class="progress-bar progress-bar-success" role="progressbar"
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q5", "Bonne", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Bonne (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q5", "Bonne", m_id)/ResultatDB.count(m_id)*100)+"%");%>)

                                          </div>
                                          <div class="progress-bar progress-bar-info" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q5", "Moyenne", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Moyenne (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q5", "Moyenne", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                          <div class="progress-bar progress-bar-warning" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q5", "Mauvaise", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Mauvaise (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q5", "Mauvaise", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                     </div>
                        <h4>#3 Le formateur utilise une langue à l'écrit </h4>
                                
                                <div class="progress">
                                          <div class="progress-bar progress-bar-success" role="progressbar"
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q6", "Bonne", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Bonne (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q6", "Bonne", m_id)/ResultatDB.count(m_id)*100)+"%");%>)

                                          </div>
                                          <div class="progress-bar progress-bar-info" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q6", "Moyenne", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Moyenne (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q6", "Moyenne", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                          <div class="progress-bar progress-bar-warning" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q6", "Mauvaise", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Mauvaise (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q6", "Mauvaise", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                     </div>
                                     
                        <h4>#4 Le formateur fait preuve de disponibilité et offre son soutien au participants</h4>
                               <div class="progress">
                                      <div class="progress-bar progress-bar-info" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q7", "oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q7", "oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                          <div class="progress-bar progress-bar-warning" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q7", "non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q7", "non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                 </div><hr>
                        <h3>L'enseignement</h3>
                        <h4>#1 Le formateur a respecté le rythme d’apprentissage des participants </h4>
                                    
                              <div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar"
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q8", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q8", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								    
								  </div>
								  <div class="progress-bar progress-bar-info" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q8", "plus ou moins", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    plus ou moins (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q8", "plus ou moins", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
								  <div class="progress-bar progress-bar-warning" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q8", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q8", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
							 </div>
                       
                        <h4>#2 Les techniques d’enseignement ont favorisé l’apprentissage </h4>
                                
                                      <div class="progress">
                                          <div class="progress-bar progress-bar-success" role="progressbar"
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q9", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q9", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)

                                          </div>
                                          <div class="progress-bar progress-bar-info" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q9", "plus ou moins", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            plus ou moins (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q9", "plus ou moins", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                          <div class="progress-bar progress-bar-warning" role="progressbar" 
                                          style="width:calc(<%= ResultatDB.getNombre_Reponses("q9", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                            Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q9", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                          </div>
                                     </div>

                        <h4>#3 Le formateur utilise des ressources didactiques variées et appropriées </h4>
                                        
                                              <div class="progress">
                                                  <div class="progress-bar progress-bar-success" role="progressbar"
                                                  style="width:calc(<%= ResultatDB.getNombre_Reponses("q10", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                    Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q10", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                    </div>
                                                  <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                  style="width:calc(<%= ResultatDB.getNombre_Reponses("q10", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                    Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q10", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                  </div>
                                             </div>
                                              
                        <h4>#4 Le contenus et le programme de la formation est respecté </h4>
                                                
                                          <div class="progress">
                                              <div class="progress-bar progress-bar-success" role="progressbar"
                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q11", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q11", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                </div>
                                              <div class="progress-bar progress-bar-warning" role="progressbar" 
                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q11", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q11", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                              </div>
                                         </div>
                                                      
                        <hr>
                        <h3>L'evaluation </h3>
                        <h4>#1 Le formateur choisit des instruments d'évaluation pertinents au regard des objectifs poursuivis </h4>
                                        
                                                  
                                                  <div class="progress">
                                                      <div class="progress-bar progress-bar-success" role="progressbar"
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q12", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q12", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)

                                                      </div>
                                                      <div class="progress-bar progress-bar-info" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q12", "plus ou moins", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        plus ou moins (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q12", "plus ou moins", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                      <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q12", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q12", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                 </div>
                                                  

                        <h4>#2 Le Formateur utilise des moyens variés pour évlauer les apprentissages des participants (tests, travaux partiques ...) </h4>
                                            
                                                          <div class="progress">
                                                              <div class="progress-bar progress-bar-success" role="progressbar"
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q13", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q13", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                                </div>
                                                              <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q13", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q13", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                              </div>
                                                         </div>
                                                          
                        <h4>#3 Les évaluations sont généralement de niveau </h4>
                                        
                                        
                                        <div class="progress">
                                                      <div class="progress-bar progress-bar-danger" role="progressbar"
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q14", "Trop difficile", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Trop difficile (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q14", "Trop difficile", m_id)/ResultatDB.count(m_id)*100)+"%");%>)

                                                      </div>
                                                      <div class="progress-bar progress-bar-primary" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q14", "difficile", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        difficile (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q14", "difficile", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                      <div class="progress-bar progress-bar-success" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q14", "Equilibré", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Equilibré (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q14", "Equilibré", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                      <div class="progress-bar progress-bar-info" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q14", "Moyen", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Moyen (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q14", "Moyen", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                      <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q14", "Facile", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Facile (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q14", "Facile", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                 </div>

                        <h4>#4 Le formateur utilise les résultats de l'évaluation pour détecter certaines difficultés, determiner les causes et proposer des activités correctives </h4>
                                
                                                          <div class="progress">
                                                              <div class="progress-bar progress-bar-success" role="progressbar"
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q15", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q15", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                                </div>
                                                              <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q15", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q15", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                              </div>
                                                         </div>
                                                          
                        <hr>
                        <h3>Techniques </h3>
                        <h4>#1 Le formateur emploie les diagrammes, les illustartions, les video ...</h4>
                                        
                                                                  <div class="progress">
                                                              <div class="progress-bar progress-bar-success" role="progressbar"
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q16", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q16", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                                </div>
                                                              <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q16", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q16", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                              </div>
                                                         </div>
                                                                  
                        <h4>#2 Le formateur emploie les nouvelles technologies (pc, projecteur ...) </h4>
                                    
                                                                 <div class="progress">
                                                              <div class="progress-bar progress-bar-success" role="progressbar"
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q17", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q17", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                                </div>
                                                              <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                              style="width:calc(<%= ResultatDB.getNombre_Reponses("q17", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                                Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q17", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                              </div>
                                                         </div>
                                                                  
                        <h4>#3 le formateur met ses cours à disponibilité des participants par internet </h4>
                                            
                                                <div class="progress">
                                                      <div class="progress-bar progress-bar-success" role="progressbar"
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q18", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q18", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                        </div>
                                                      <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q18", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q18", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                 </div>
                                                                  
                        <hr>
                        <h3>Autres qualités professionelles </h3>
                        <h4>#1 Le formateur métrise les propos de la formation </h4>
                                        
                            <div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar"
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q19", "Beaucoup", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Beaucoup (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q19", "Beaucoup", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								    
								  </div>
								  <div class="progress-bar progress-bar-info" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q19", "Moyennement", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Moyennement (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q19", "Moyennement", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
								  <div class="progress-bar progress-bar-warning" role="progressbar" 
								  style="width:calc(<%= ResultatDB.getNombre_Reponses("q19", "Un peu", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
								    Un peu (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q19", "Un peu", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
								  </div>
							 </div>
                                                          
                        <h4>#2 Le formateur prépare un cours comprehensible </h4>
                                    
                                      <div class="progress">
                                                      <div class="progress-bar progress-bar-success" role="progressbar"
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q20", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q20", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                        </div>
                                                      <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q20", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q20", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                 </div>
                                      
                        <h4>#3 Le formateur prépare un cours realiste et qui respecte la durée de la formation</h4>
                                    
                                                          <div class="progress">
                                                      <div class="progress-bar progress-bar-success" role="progressbar"
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q21", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q21", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                        </div>
                                                      <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q21", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q21", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                 </div>
                                                          
                        <h4>#4 Le formateur prends en compte les nouvelles notions qui changent ou s'ajoute en cours </h4>
                                        
                                                          <div class="progress">
                                                      <div class="progress-bar progress-bar-success" role="progressbar"
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q22", "Oui", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Oui (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q22", "Oui", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                        </div>
                                                      <div class="progress-bar progress-bar-warning" role="progressbar" 
                                                      style="width:calc(<%= ResultatDB.getNombre_Reponses("q22", "Non", m_id) %>/<%=ResultatDB.count(m_id)%>*100%)">
                                                        Non (<%out.print(String.format("%.0f",(float)ResultatDB.getNombre_Reponses("q22", "Non", m_id)/ResultatDB.count(m_id)*100)+"%");%>)
                                                      </div>
                                                 </div>
                                                          
                        <hr>
                        <div class="form-group">
                            <label for="ta">Ajouter un commentaire</label>
                            <c:forEach items="${ ResultatDB.getComms(m_id) }" var="elem">
                            	<textarea class="form-control" id="ta" rows="2" name="commentaire" readonly>${ elem }</textarea>
                            </c:forEach>
                            
                        </div>
                    </form>
			</div>
			<!-- /page content -->
			
			
   <%@ include file="inc/includes/footer.jsp" %>
