// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//= require jquery3
//= require jquery
//= require jquery_ujs
//= require popper
//= require turbolinks
//= require bootstrap
//= require select2
//= require calendar
//= require data-confirm-modal
//= require cocoon
//= require_tree .
//= require bootstrap-sprockets


// Se oculta el flash message
window.setTimeout(function() {
    $(".flash_hidden").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
}, 2000);
