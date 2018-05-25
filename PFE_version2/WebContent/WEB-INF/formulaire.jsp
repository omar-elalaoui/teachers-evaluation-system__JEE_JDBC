<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ModuleDB, beans.Module" %>
<!DOCTYPE html>
<html>

<head>
    <title>Formulaire</title>
    <meta charset="utf-8">
     
	<link rel="stylesheet" href="inc/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="inc/css/bootstrap.css">
	<link rel="stylesheet" href="inc/css/fontawesome-all.min.css">
    <style>
        body.eva {
            margin-top: 50px;
        }

        div.panel-heading.eva {
            font-weight: bold;
        }

        form h3 {
            text-decoration: underline;
        }

        div.radios {
            margin-left: 50px;
        }

        button.sm {
            display: table;
            margin: auto;
        }
		label.radio{
			font-weight: normal;
		}
    </style>
</head>

    <body class="eva">
        <div class="container">
        	<%
        		int m_id= (int)request.getAttribute("module_id") ;
        		Module m= ModuleDB.get(m_id);
        		pageContext.setAttribute("module", m);
        	%>
        	<div class="alert alert-info">
				   <i class="glyphicon glyphicon-info-sign"></i> &nbsp;Merci de bien vouloir remplir ce formulaire d'évaluation, sur le module &nbsp;<Strong>${ module.getModule() }</Strong> 
					&nbsp;encadrée par <Strong>${ ModuleDB.getFormateur(module.getId()).getPrenom() } ${ ModuleDB.getFormateur(module.getId()).getNom() }</Strong>
			</div>
            <div class="panel panel-primary">
                <div class="panel-heading eva">Formulaire d'évaluation </div>
                <div class="panel-body">
                    <p>Ce questionnaire comporte plusieurs volets . N’hésitez pas à ajouter vos commentaires dans les cases appropriées. Ils nous seront précieux. Merci à l’avance. Soyez assuré(e) que vos réponses demeureront confidentielles.</p>
                    <hr>
                    <form action="ValiderFormulaire">
                        <h3>La formation</h3><br>
                        <h4>#1 Dans cette formation j'ai appris </h4>
                        <input type="text" value="${ module.getId() }" name="module_id" hidden=hidden>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Beaucoup" name="formation_q1" required>Beaucoup</label>
                            <label class="radio"><input type="radio" value="Moyennement" name="formation_q1" required>Moyennement</label>
                            <label class="radio"><input type="radio" value="Un peu" name="formation_q1" required>Un peu</label>
                            <label class="radio"><input type="radio" value="Rien" name="formation_q1" required>Rien</label>
                        </div>
                        <h4>#2 Le contenu de la formation correspondait à mes besoins </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="formation_q2" required>Oui </label>
                            <label class="radio"><input type="radio" value="plus ou moins" name="formation_q2" required>plus ou moins</label>
                            <label class="radio"><input type="radio" value="Non" name="formation_q2" required>Non </label>
                        </div>
                        <h4>#3 De façon général, les séances se déroulent dans de bonnes conditions </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="formation_q3" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="formation_q3" required>Non </label>
                            <label class="radio"><input type="radio" value="Parfois" name="formation_q3" required>Parfois </label>
                        </div>
                        <hr>

                        <h3>La Communication</h3>
                        <br>
                        <h4>#1 Le formateur communiquait d’une façon claire et dynamique </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="communication_q1" required>Oui </label>
                            <label class="radio"><input type="radio" value="plus ou moins" name="communication_q1" required>plus ou moins</label>
                            <label class="radio"><input type="radio" value="Non" name="communication_q1" required>Non </label>
                        </div>

                        <h4>#2 Le formateur utilise une langue dans ses échanges verbaux </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Bonne" name="communication_q2" required>Bonne </label>
                            <label class="radio"><input type="radio" value="Moyenne" name="communication_q2" required>Moyenne </label>
                            <label class="radio"><input type="radio" value="Mauvaise" name="communication_q2" required>Mauvaise </label>
                        </div>
                        <h4>#3 Le formateur utilise une langue à l'écrit </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Bonne" name="communication_q3" required>Bonne </label>
                            <label class="radio"><input type="radio" value="Moyenne" name="communication_q3" required>Moyenne </label>
                            <label class="radio"><input type="radio" value="Mauvaise" name="communication_q3" required>Mauvaise </label>
                        </div>
                        <h4>#4 Le formateur fait preuve de disponibilité et offre son soutien au participants</h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="communication_q4" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="communication_q4" required>Non </label>
                        </div>
                        <hr>
                        <h3>L'enseignement</h3>
                        <br>
                        <h4>#1 Le formateur a respecté le rythme d’apprentissage des participants </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q1" required>Oui </label>
                            <label class="radio"><input type="radio" value="plus ou moins" name="enseignement_q1" required>plus ou moins</label>
                            <label class="radio"><input type="radio" value="Non" name="enseignement_q1" required>Non </label>
                        </div>
                        <h4>#2 Les techniques d’enseignement ont favorisé l’apprentissage </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q2" required>Oui </label>
                            <label class="radio"><input type="radio" value="plus ou moins" name="enseignement_q2" required>plus ou moins</label>
                            <label class="radio"><input type="radio" value="Non" name="enseignement_q2" required>Non </label>
                        </div>

                        <h4>#3 Le formateur utilise des ressources didactiques variées et appropriées </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q3" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="enseignement_q3" required>Non </label>
                        </div>
                        <h4>#4 Le contenus et le programme de la formation est respecté </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="enseignement_q4" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="enseignement_q4" required>Non </label>
                        </div>
                        <hr>
                        <h3>L'evaluation </h3>
                        <br>
                        <h4>#1 Le formateur choisit des instruments d'évaluation pertinents au regard des objectifs poursuivis </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="evaluation_q1" required>Oui </label>
                            <label class="radio"><input type="radio" value="plus ou moins" name="evaluation_q1" required>plus ou moins</label>
                            <label class="radio"><input type="radio" value="Non" name="evaluation_q1" required>Non </label>
                        </div>

                        <h4>#2 Le Formateur utilise des moyens variés pour évlauer les apprentissages des participants (tests, travaux partiques ...) </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="evaluation_q2" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="evaluation_q2" required>Non </label>
                        </div>
                        <h4>#3 Les évaluations sont généralement de niveau </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Trop difficile" name="evaluation_q3" required>Trop difficile </label>
                            <label class="radio"><input type="radio" value="difficile" name="evaluation_q3" required>difficile </label>
                            <label class="radio"><input type="radio" value="Equilibré" name="evaluation_q3" required>Equilibré</label>
                            <label class="radio"><input type="radio" value="Moyen" name="evaluation_q3" required>Moyen </label>
                            <label class="radio"><input type="radio" value="Facile" name="evaluation_q3" required>Facile</label>
                        </div>

                        <h4>#4 Le formateur utilise les résultats de l'évaluation pour détecter certaines difficultés, determiner les causes et proposer des activités correctives </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="evaluation_q4" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="evaluation_q4" required>Non </label>
                        </div>
                        <hr>
                        <h3>Techniques </h3>
                        <br>
                        <h4>#1 Le formateur emploie les diagrammes, les illustartions, les video ...</h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="techniques_q1" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="techniques_q1" required>Non </label>
                        </div>
                        <h4>#2 Le formateur emploie les nouvelles technologies (pc, projecteur ...) </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="techniques_q2" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="techniques_q2" required>Non </label>
                        </div>
                        <h4>#3 le formateur met ses cours à disponibilité des participants par internet </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui" name="techniques_q3" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="techniques_q3" required>Non </label>
                        </div>
                        <hr>
                        <h3>Autres qualités professionelles </h3>
                        <br>
                        <h4>#1 Le formateur métrise les propos de la formation </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Beaucoup" name="autres_q1" required>Beaucoup </label>
                            <label class="radio"><input type="radio" value="Moyennement" name="autres_q1" required>Moyennement </label>
                            <label class="radio"><input type="radio" value="Un peu" name="autres_q1" required>Un peu</label>
                        </div>
                        <h4>#2 Le formateur prépare un cours comprehensible </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui " name="autres_q2" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="autres_q2" required>Non </label>
                        </div>
                        <h4>#3 Le formateur prépare un cours realiste et qui respecte la durée de la formation</h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui " name="autres_q3" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="autres_q3" required>Non </label>
                        </div>
                        <h4>#4 Le formateur prends en compte les nouvelles notions qui changent ou s'ajoute en cours </h4>
                        <div class="radios">
                            <label class="radio"><input type="radio" value="Oui " name="autres_q4" required>Oui </label>
                            <label class="radio"><input type="radio" value="Non" name="autres_q4" required>Non </label>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="ta">Ajouter un commentaire</label>
                            <textarea class="form-control" id="ta" rows="3" name="commentaire"></textarea>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-primary btn-lg sm">Valider le formulaire</button>
                    </form>
                    <br>
                </div>
            </div>
        </div>
        
    <script src="inc/js/jquery-3.1.1.min.js"></script>
    <script src="inc/js/main.js"></script>
    <script src="inc/js/bootstrap.min.js"></script>
	<script src="inc/js/bootstrap-select.min.js"></script>
</body>

</html>
