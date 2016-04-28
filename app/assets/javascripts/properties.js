/*global $*/

$(function() {
    $("button.comment_login").click(function() {
        $("#new_comment").removeClass("hidden");
        $(".field textarea").focus();
        $(this).addClass("hidden");
    });
    
    $("button.cancel").click(function() {
        $("#new_comment").addClass("hidden");
        $("button.comment_login").removeClass("hidden");
        return false;
    });
});