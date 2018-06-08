//= require moment
//= require fullcalendar

// Optional locale  change '// require' --> '//= require' to enable
// require fullcalendar/locale-all
// or sepecific locale
// require fullcalendar/locale/ms

// Optional addons  change '// require' --> '//= require' to enable
// require fullcalendar/scheduler
// require fullcalendar/gcal

$(document).on('turbolinks:load', function() {
   console.log('(document).turbolinks:load');
   // Actions to do
   $('#calendar').fullCalendar({
     themeSystem: 'bootstrap4',
     header: {
       left: 'prev,next today',
       center: 'title',
       right: 'month,agendaWeek,agendaDay'
     },
     selectable: true,
     selectHelper: true,
     editable: true,
     eventLimit: true,
     events: '/events.json',

     select: function(start, end) {
       return newEvent(start, end);
     },

     eventClick: function(event, jsEvent, view) {
       $.getScript(event.edit_url, function() {});

       //call ajax to show preview of the post in the preview container
       var event_select = $(this).data(event._id);
         //this is the show call to posts_controller#show

         $.ajax({
           url: "/event/'"+post_id,
           beforeSend: function( xhr ) {}
         })
         .done(function( data ){});
     },

     eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc) {
       return updateEvent(event);
     },
     eventResize: function(event, dayDelta, minuteDelta, revertFunc) {
         return updateEvent(event);
     },


   });
});

newEvent = function(start_time, end_time){
  $.ajax({
    type: "GET",
    url: "/events/new",
    data: {
      star_time: "" + start_time.format('YYYY-MM-DD'),
      end_time: "" + end_time.format('YYYY-MM-DD'),
    }
  });

  //$.getScript(event.new_url, function() {});
};

updateEvent = function(the_event) {
  $.ajax({
    type: "PATCH",
    url: "/events/" + the_event.id,
    data: {
      event: {
        description: the_event.description || "",
        star_time: "" + new Date(the_event.start).toUTCString(),
        end_time: "" + new Date(the_event.end).toUTCString(),
        type_event: the_event.type_event,
        user_id: the_event.user_id,
        authenticity_token: "<%= form_authenticity_token %>"
      }
    }

  });
};
