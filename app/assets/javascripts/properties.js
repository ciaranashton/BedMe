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
    
    $(".delete_comment").click(function() {
        $(this).addClass("hidden");
        $(".confirm_delete_comment").removeClass("hidden");
    });
    
    $(".delete_cancel").click(function() {
        $(".delete_comment").removeClass("hidden");
        $(".confirm_delete_comment").addClass("hidden");
    })
});