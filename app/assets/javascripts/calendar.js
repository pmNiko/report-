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
  $('#flash_hidden').delay(8000).fadeOut();
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
      if(true){
        return newEvent(start, end);
      }else{
        return""
      }
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
};

updateEvent = function(event) {
  $.ajax({
    type: "PATCH",
    url: "/events/" + event.id,
    data: {
      event: {
        description: event.description || "",
        star_time: "" + new Date(event.start).toUTCString(),
        end_time: "" + new Date(event.end).toUTCString(),
        type_event: event.type_event,
        user_id: event.user_id,
      }
    }

  });
};
