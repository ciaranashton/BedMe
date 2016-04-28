/*global $*/

$(function() {
    $("button.comment_login").click(function() {
        $(".field").removeClass("hidden");
        $(".field textarea").focus();
        $(this).addClass("hidden");
    });
    
    $("button.cancel").click(function() {
        $(".field").addClass("hidden");
        $("button.comment_login").removeClass("hidden");
        return false;
    });
});