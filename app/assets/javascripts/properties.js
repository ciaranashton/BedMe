/*global $*/

$(function() {
    $(".comment_link").click(function() {
        $(".field").removeClass("hidden");
        $(this).addClass("hidden");
    });
    
    $("button.cancel").click(function() {
        $(".field").addClass("hidden");
        $(".comment_link").removeClass("hidden");
        return false;
    });
});