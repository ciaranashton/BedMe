/*global $*/

$(function() {
	$("form input.btn_main").prop("disabled", true);
	
    $(".text_input").on("focusin", function() {
		$(this).addClass("focused");
	});
	$(".text_input").on("focusout", function() {
		$(this).removeClass("focused");
	});
	
	$("input[type=email").on("change paste keyup input", function() {
		validateField($(this), function(email) {
				return new RegExp("^[A-Z0-9\\-]+(?:\\.[A-Z0-9\\-]+)*@[A-Z0-9\\-]+(?:\\.[A-Z0-9\\-]+)+$", "i").exec(email);
			}, "Invalid email address");
	});
	$("#txt_userPassword input, #txt_username input").on("change paste keyup input", function() {
		validateField($(this), function(p) { return p.length > 0; }, "");
	});
	$("#txt_newPassword input").on("change paste keyup input", function() {
		validateField($(this), function(p) { return p.length >=6; }, "Password is too short");
		validateField($("#txt_confirmPassword input"), function(p) { return p == $("#txt_newPassword input").val(); }, "Passwords do not match");
	});
	$("#txt_confirmPassword input").on("change paste keyup input", function() {
		validateField($(this), function(p) { return p == $("#txt_newPassword input").val(); }, "Passwords do not match");
	});
	
});

function validateField(input, validator, errorMessage) {
	var field = input.parent(".text_input");
	
	field.removeClass("valid error");
	    
    if (input.val() == "") {
        field.children("label").fadeOut(50);
    } else {
        field.children("label").fadeIn(200);
        
	    if (validator(input.val())) {
	      	field.addClass("valid");
	      	field.children(".info").html("");
	    } else {
	      	field.addClass("error");
        	field.children(".info").html(errorMessage);
	    }
    }
    
    $(".text_input").each(function() {
    	if ($(this).hasClass("valid")) {
        	$("form input.btn_main").prop("disabled", false);
        } else {
            $("form input.btn_main").prop("disabled", true);
            return false;
	    }
    });
}