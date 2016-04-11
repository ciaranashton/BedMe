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
		validateField($(this), 
			function(email) {
				var rgxValidEmail = new RegExp("^[A-Z0-9\\-]+(?:\\.[A-Z0-9\\-]+)*@[A-Z0-9\\-]+(?:\\.[A-Z0-9\\-]+)*$", "i").exec(email);
				return rgxValidEmail;
			}
			, "Invalid email address");
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