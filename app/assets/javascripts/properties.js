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
    
    $(".delete_comment, .delete_review").click(function() {
        $(this).addClass("hidden");
        $(this).siblings(".confirm_delete_comment, .confirm_delete_review").removeClass("hidden");
    });
    
    $(".delete_cancel").click(function() {
        $(".delete_comment, .delete_review").removeClass("hidden");
        $(".confirm_delete_comment, .confirm_delete_review").addClass("hidden");
    })
});