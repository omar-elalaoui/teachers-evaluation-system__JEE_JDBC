<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="inc/css/bootstrap.css" >
		<link rel="stylesheet" href="inc/css/custom.min.css" >
		<title>Modifier mot de passe</title>
		<style>
			body{
				padding-top: 200px;
			}
			label{
				color: #bdc3c7;
			}
		</style>
</head>
<body>
	
								<form id="demo-form2" class="form-horizontal form-label-left" action="ModifierCompte" method="post">
                                        <!--message de mot de pass-->
                                        <div class="form-group pwdd_alert" hidden="hidden" id="b-alert">
                                            <label class="control-label col-md-4 col-sm-4"></label>
                                            <div class="alert alert-danger alert_pwdd col-md-4 col-sm-4">
                                                
                                            </div>
                                        </div>
                                        <!--fin message de mot de pass-->
                                        
                                        <div class="form-group" <% if(request.getAttribute("messageSS") == null && request.getAttribute("messageErr") == null){%> hidden='hidden' <%} %>>
                                            <label class="control-label col-md-4 col-sm-4 col-xs-12" ></label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div id="b-alert">
                                                	<c:if test="${ messageSS }">
                                                		<div class="alert alert-success fontPlus">
														  <strong>succès!</strong> Le mote de passe a bien été modifié.
														</div>
                                                	</c:if>
                                                	
                                                	<c:if test="${ messageErr }">
                                                		<div class="alert alert-danger fontPlus">
														  <strong>Erreur!</strong> Ancien mot de passe n'est pas correcte.
														</div>
                                                	</c:if>
                                                	
                                                	<c:if test="${ messageErr2 }">
                                                		<div class="alert alert-danger fontPlus">
														  <strong>Erreur!</strong> Email n'est pas correcte.
														</div>
                                                	</c:if>
								                	
								                </div>
                                            </div>
                                        </div>
                                        
                                        <input type="password" name="compteType" value="admin" hidden="hidden">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 col-sm-4 col-xs-12" for="last-name">Ancien mot de passe <span class="required">*</span></label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <input type="password" name="ppwd" value="" class="form-control col-md-7 col-xs-12" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4 col-sm-4 col-xs-12" for="last-name">Nouveau mot de passe <span class="required">*</span></label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <input type="password" name="pwd1" required class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4 col-sm-4 col-xs-12" for="last-name">Confirmer mot de passe <span class="required">*</span></label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <input type="password" name="pwd2" required class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="form-group">
                                            <div class="col-md-7 col-sm-7 col-xs-12 col-md-offset-4">
                                                <button class="btn btn-primary" type="reset">Réinitialiser</button>
                                                <button type="submit" class="btn btn-success">Enregistrer</button>
                                            </div>
                                        </div>
                                    </form>

<script src="inc/js/jquery.min.js" ></script>
<script src="inc/js/bootstrap.min.js"></script>
<script src="inc/js/custom.min.js"></script>
<script type="text/javascript">
    $('form').on('submit', function (e) {
    	var messageElem= $(".alert_pwdd");
        if ($("[name='pwd1']").val() != $("[name='pwd2']").val()) {
            e.preventDefault();
            messageElem.html("<strong>Oops!</strong> Les deux champs de mot de passe ne correspondent pas !!");
            $(".pwdd_alert").show();
        }
    });
    </script>
</body>
</html>