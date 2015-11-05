// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).keypress(function(e){
    if (e.which == 13){
        $("#continue_button").click();
    }
});