// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery
//= require jquery_ujs
//= require popper
//= require turbolinks
//= require bootstrap
//= require select2_simple_form
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
$(document).on('ready page:load', function () {
  // Actions to do
  $('#calendar').fullCalendar({
    themeSystem: 'bootstrap4',
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    }
  });
});
