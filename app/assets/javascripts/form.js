/*global $*/

$(function() {
    $(".text_input").on("focusin", function() {
		$(this).addClass("focused");
	});
	$(".text_input").on("focusout", function() {
		$(this).removeClass("focused");
	});
	
	$(".email_validator input").on("change paste keyup input", function() {
		validateField($(this), function(email) {
				return new RegExp("^[A-Z0-9\\-]+(?:\\.[A-Z0-9\\-]+)*@[A-Z0-9\\-]+(?:\\.[A-Z0-9\\-]+)+$", "i").exec(email);
			}, "Invalid email address");
	});
	$(".not_empty_validator input").on("change paste keyup input", function() {
		validateField($(this), function(f) { return f.length > 0; }, "");
	});
	$(".username_validator input").on("change paste keyup input", function() {
		validateField($(this), function(f) { return f.length > 0 && f.length < 50; }, "Username is too long");
	});
	$(".postcode_validator input").on("change paste keyup input", function() {
		validateField($(this), function(postcode) {
			return new RegExp("[A-Z]{2}[0-9]{1,2}\\s?[0-9][A-Z]{2}", "i").exec(postcode);
		}, "Invalid postcode")
	})
	$("#password_new input").on("change paste keyup input", function() {
		validateField($(this), function(p) { return p.length >=6; }, "Password is too short");
		validateField($("#password_confirm input"), function(p) { return p == $("#password_new input").val(); }, "Passwords do not match");
	});
	$("#password_confirm input").on("change paste keyup input", function() {
		validateField($(this), function(p) { return p == $("#password_new input").val(); }, "Passwords do not match");
	});
	
	$("form input.main").prop("disabled", true);
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
        	$("form input.main").prop("disabled", false);
        } else {
            $("form input.main").prop("disabled", true);
            return false;
	    }
    });
}