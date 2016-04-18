/*global $*/

$(function() {
    $("button.comment_login").click(function() {
        $(".field").removeClass("hidden");
        $(this).addClass("hidden");
    });
    
    $("button.cancel").click(function() {
        $(".field").addClass("hidden");
        $("button.comment_login").removeClass("hidden");
        return false;
    });
});