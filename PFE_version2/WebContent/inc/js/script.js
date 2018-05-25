$(document).ready(function () {
	

    /*--ajouter & supprimer un champ de module--*/
    $("form.formation_form button.add").click(function () {
        var lastModule = $(this).closest("form");
        lastModule.find(".form-group:last").after('<div class="form-group"><label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"> </label><div class="col-md-6 col-sm-6 col-xs-12"> <div class="input-group"><input type="text" name="module" required class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-default del"><i class="fa fa-times text-danger"></i></button></span></div></div></div>');
    });

    $(".formation_form").on("click", "button.del", function () {
        $(this).closest(".form-group").remove();
    });

    $(".formateur_module_modifier_form").on("click", "button.supp", function () {
        $(this).toggleClass("btn-default btn-danger");
        var moduleInput = $(this).closest(".input-group").find("input:hidden");
        if (moduleInput.attr("name")) {
            moduleInput.removeAttr("name");
        } else {
            moduleInput.attr("name", "module");
        }
    });

    $(".forme_module_modifier_form").on("click", "button.supp", function () {
        $(this).toggleClass("btn-default btn-danger");
        var moduleInput = $(this).closest(".input-group").find("input:last");
        if (moduleInput.attr("name")) {
            moduleInput.removeAttr("name");
        } else {
            moduleInput.attr("name", "formation");
        }
    });

    $(".moduleSelect").on("change", function () {
        var Modules = $("<div>");
        $(".moduleSelect option:selected").each(function () {
            Modules.append('<div class="form-group-s"><div class="input-group"><input type="text" READONLY required class="form-control" value="' + $(this).text() + '"><span class="input-group-btn"><button type="button" class="btn btn-success"><i class="fa fa-check"></i></button></span></div><div class="clearfix"></div><input style="display:none;"type="number" value="' + $(this).val() + '" name="module"></div>');
        });
        $(".modules_ajoutes").html(Modules.html());
    });

    $(".selectFormation").on("change", function () {
        var formations = $("<div>");
        $(".selectFormation option:selected").each(function () {
            formations.append('<div class="form-group-s"><div class="input-group"><input type="text" READONLY required class="form-control" value="' + $(this).text() + '"><span class="input-group-btn"><button type="button" class="btn btn-success"><i class="fa fa-check"></i></button></span></div><div class="clearfix"></div><input style="display:none;"type="number" value="' + $(this).val() + '" name="formation"></div>');
        });
        $(".formation_ajoutes").html(formations.html());
    });
    /*--fin fin ajouter & supprimer un champ de module--*/


    /*--mot de passe check--*/
    $(".assistant_form .pwd_alert").hide();
    $('.assistant_form').on('submit', function (e) {
        if ($("[name='pwd1']").val() != $("[name='pwd2']").val()) {
            e.preventDefault();
            $(".assistant_form .pwd_alert").show();
        }
    });
    $('.assistant_form [name="pwd2"]').keyup(function () {
        $(".assistant_form .pwd_alert").hide();
    });
    /*--fin fin mot de passe check--*/
    
    /*--date check--*/
    $(".date_alert").hide();
    $('.ajouterFormation_form').on('submit', function (e) {
    	var dateD= new Date($(".ajouterFormation_form input[name='date_debut']").val());
    	var dateF= new Date($(".ajouterFormation_form input[name='date_fin']").val());
        if (dateD > dateF) {
            e.preventDefault();
            $(".ajouterFormation_form .date_alert").show();
        }
    });
    
    $(".date_alert").hide();
    $('.mm_form').on('submit', function (e) {
    	var dateD= new Date($(".mm_form input[name='date_debut']").val());
    	var dateF= new Date($(".mm_form input[name='date_fin']").val());
        if (dateD > dateF) {
            e.preventDefault();
            $(".mm_form .date_alert").show();
        }
    });
    
    $('.assistant_form [name="pwd2"]').keyup(function () {
        $(".assistant_form .pwd_alert").hide();
    });
    /*--fin fin date check--*/
    
    /*--date date naissance--*/
    $(".message_alert").hide()
    $('.ajouterFF_form, .formateurModifierProfile, .formeModifierProfile').on('submit', function (e) {
    	var dateN= new Date($(this).find("input[name='date_naissance']").val());
    	var tele= $(this).find("input[name='telephone']").val();
    	var alert= $(this).find(".message_alert");
    	
        if (tele.charAt(0) != '0'  || tele.length < 10) {
            e.preventDefault();
            alert.find(".alert_small").html("Telephone doit etre commencé par 0 et contient 10 chiffres !!");
            alert.show();
        }else if (dateN > new Date()) {
        	e.preventDefault();
        	alert.find(".alert_small").html("La date de naissance est superieur de la date actuelle !!");
            alert.show();
        }else{ alert.hide(); }
    });
    
    $('.assistant_form [name="pwd2"]').keyup(function () {
        $(".assistant_form .pwd_alert").hide();
    });
    /*--fin fin date naissance --*/


    
    $('.assistant_form [name="pwd2"]').keyup(function () {
        $(".assistant_form .pwd_alert").hide();
    });
    
    /*--check number input--*/
    $(document).ready(function() {
        $('.inputNumber').keyup(function() {
            var numbers = $(this).val();
            $(this).val(numbers.replace(/\D/, ''));
        });
    });
    /*--fin fin check number input--*/
    
    //select picker
    $('.moduleSelect').selectpicker();
    $('.selectpicker, .moduleSelect').selectpicker({
        dropupAuto: false
    });


});


/*--Les fonctions de Ajax--*/

function sendAjax(name, id) {

    $.ajax({
        url: "InfoPlus",
        type: "get",
        data: "name=" + name + "&id=" + id,
        datatype: "html",
        success: function (htmlresponse) {
            if (name == "formateurProfile") {
                $('#formateurProfileAjax').html(htmlresponse);

            } else if (name == "formateurModules") {
            	var div = $("<div>").html(htmlresponse);
            	var formatuerNomM= div.find("#nom").html();
            	var modulesList= div.find("#modulesList").html();
            	
            	$('#formatuerNomM').html(formatuerNomM);
                $('#formateurModulesListAjax').html(modulesList);

            } else if (name == "affecterChangerModules") {                
                var div = $("<div>").html(htmlresponse);
            	var formateurNomMF = div.find("#nom").html();
            	var Modules= div.find("#modules").html();
            	
            	$('#formateurNomMF').html(formateurNomMF);
                $('#affecterChangerModulesAjax').html(Modules);

            } else if (name == "formeProfile") {
                $('#formeProfileAjax').html(htmlresponse);

            } else if (name == "formeFormations") {
                $('#formeFormationsAjax').html(htmlresponse);

            } else if (name == "affecterChangerFormations") {
            	var div = $("<div>").html(htmlresponse);
            	var formeNom = div.find("#nom").html();
            	var listFormation= div.find("#listFormations").html();
            	
            	$('#formeNom').html(formeNom);
                $('#affecterChangerFormationsAjax').html(listFormation);

            } else if (name == "formationPlus") {
                var div = $("<div>").html(htmlresponse);
                
                var formationTitre = div.find("#formationTitre").html();
                var formationPlus = div.find('#formationInfo').html();
                var table_formateurs = div.find('#tableFormateurs').html();
                var table_forme = div.find('#tableFormes').html();
                var table_modules = div.find('#listModules').html();
                
                $('#formationTitre').html(formationTitre);
                $('#formationPlusBody').html(formationPlus);
                $('#formateursTableBody').html(table_formateurs);
                $('#formesTableBody').html(table_forme);
                $('#listModules').html(table_modules);
            }

        },
        error: function (jqXHR, exception) {
            alert("exception: " + exception + "   status: " + jqXHR.status + "    responseText: " + jqXHR.responseText);
        }
    })

}



function notif(){
	 $.ajax({
	        url: "Notification",
	        type: "get",
	        success: function (htmlresponse) {
	        	$(".notif").html("");
	        }
	 });
}

function getModulesAjax(arg) {
    var arr = [];
    $("select.selectFormation option:selected").each(function () {
        arr.push($(this).val());
    });
    if (!arr[0]) {
        $("select.moduleSelect").html(" ");
        $('.moduleSelect').selectpicker('refresh');
    } else {
        $.ajax({
            url: "ModulesFormation",
            type: "get",
            data: {
                formation_id: arr
            },
            //dataType: 'json',
            success: function (data) {
                var Wrapper = $("<div>");
                $.each(data[0], function (index, formation) {
                    var optgroup = $("<optgroup>").attr("label", formation.formation);
                    $.each(formation.modules, function (index, module) {
                        $("<option>").val(module.id).text(module.module).appendTo(optgroup);
                    });
                    optgroup.appendTo(Wrapper);
                });
                
                if(arg == 1){
                	$.each(data[1], function (index, moduleNoDispo) {
                        Wrapper.find("option").each(function (i, option) {
                            if (moduleNoDispo.id == $(option).val()) {
                                $(option).attr("disabled", "disabled");
                            }
                        });
                    });
                }
                $("select.moduleSelect").html($(Wrapper).html());
                $('.moduleSelect').selectpicker('refresh');
            },
            error: function (jqXHR, exception) {
                console.log("exception: " + exception + "   status: " + jqXHR.status + "    responseText: " + jqXHR.responseText);
            }
        });
    }

}



function checkRadios(){
	if(document.getElementById('gender_Male').checked) {
		  //Male radio button is checked
		} else if(document.getElementById('gender_Female').checked) {
		  //Female radio button is checked
		} else {
		    alert('You should select a radio button!');
		}
}


function getProfileAjax(nom, id) {
    $.ajax({
        url: "ProfileAjax",
        type: "get",
        data: {
            profileNom: nom,
            id: id
        },
        success: function (data) {
        	
            
            if (nom == "formateur") {
            	var dateN = new Date(data.date_naissance);
                var day = ("0" + dateN.getDate()).slice(-2);
                var month = ("0" + (dateN.getMonth() + 1)).slice(-2);
                var dateNaissanceF= dateN.getFullYear() + "-" + (month) + "-" + (day);
                
                var formateurForm = $("form.formateurModifierProfile");
                try {
                    var input0 = formateurForm.find("input[name='id']");
                    var input1 = formateurForm.find("input[name='prenom']");
                    var input2 = formateurForm.find("input[name='nom']");
                    var input3 = formateurForm.find("input[name='email']");
                    var input4 = formateurForm.find("input[name='telephone']");
                    var input5 = formateurForm.find("input[name='specialite']");
                    var input6 = formateurForm.find("input[name='date_naissance']");
                    var radio = formateurForm.find("input[name='genre'][value='"+data.genre+"']");
                    input0.val(data.id);
                    input1.val(data.prenom);
                    input2.val(data.nom);
                    input3.val(data.email);
                    input4.val(data.telephone);
                    input5.val(data.specialite);
                    input6.val(dateNaissanceF);
                    radio.click();
                } catch (e) {
                    alert(e.message());
                }


            } else if (nom == "forme") {
            	var dateN = new Date(data.date_naissance);
                var day = ("0" + dateN.getDate()).slice(-2);
                var month = ("0" + (dateN.getMonth() + 1)).slice(-2);
                var dateNaissanceF= dateN.getFullYear() + "-" + (month) + "-" + (day);
                
                var formeForm = $("form.formeModifierProfile");
                try {
                    var input0 = formeForm.find("input[name='id']");
                    var input1 = formeForm.find("input[name='prenom']");
                    var input2 = formeForm.find("input[name='nom']");
                    var input3 = formeForm.find("input[name='email']");
                    var input4 = formeForm.find("input[name='telephone']");
                    var input5 = formeForm.find("input[name='date_naissance']");
                    var input6 = formeForm.find("input[name='cin']");
                    var radio  = formeForm.find("input[name='genre'][value='"+data.genre+"']");
                    input0.val(data.id);
                    input1.val(data.prenom);
                    input2.val(data.nom);
                    input3.val(data.email);
                    input4.val(data.telephone);
                    input5.val(dateNaissanceF);
                    input6.val(data.cin);
                    radio.click();
                } catch (e) {
                    alert(e.message());
                }
            }else if (nom == "formation") {
            	var dateD = new Date(data.date_debut);
                var day = ("0" + dateD.getDate()).slice(-2);
                var month = ("0" + (dateD.getMonth() + 1)).slice(-2);
                var dateDS= dateD.getFullYear() + "-" + (month) + "-" + (day);
                
                var dateF = new Date(data.date_fin);
                var day = ("0" + dateF.getDate()).slice(-2);
                var month = ("0" + (dateF.getMonth() + 1)).slice(-2);
                var dateFS= dateF.getFullYear() + "-" + (month) + "-" + (day);
                
                var formationForm = $("form.formationModifier");
                try {
                    var input0 = formationForm.find("input[name='id']");
                    var input1 = formationForm.find("input[name='formation']");
                    var input2 = formationForm.find("input[name='duree']");
                    var input3 = formationForm.find("input[name='date_debut']");
                    var input4 = formationForm.find("input[name='date_fin']");
                    input0.val(data.id);
                    input1.val(data.formation);
                    input2.val(data.duree);
                    input3.val(dateDS);
                    input4.val(dateFS);
                    
                    var modules="";
                    $.each(data.modules, function (index, module) {
                        modules +='<div class="input-group"><input type="text" name="module" readonly value="'+module.module+'" required class="form-control"><span class="input-group-btn"></span></div>'; 
                    });
                    $("form.formationModifier .modulesBB").html(modules);
                    
                } catch (e) {
                    alert(e.message());
                }
            }
        },
        error: function (jqXHR, exception) {
            console.log("exception: " + exception + "   status: " + jqXHR.status + "    responseText: " + jqXHR.responseText);
        }
    });
}
