$(document).on('turbolinks:load', function () {
  var updateHour = function () {
    var date = new Date(),
        hours = date.getHours(),
        ampm,
        minutes = date.getMinutes(),
        seconds = date.getSeconds(),
        weekendDay = date.getDay(),
        day = date.getDate(),
        month = date.getMonth(),
        year = date.getFullYear();

    var pHours = document.getElementById('hours'),
        pAMPM = document.getElementById('ampm'),
        pMinutes = document.getElementById('minutes'),
        pSeconds = document.getElementById('seconds'),
        pWeekendDay = document.getElementById('weekendDay'),
        pDay = document.getElementById('day'),
        pMonth = document.getElementById('month'),
        pYear = document.getElementById('year');

    var weekend = [
      'Sunday', 'Monday', 'Tuesday', 'Wednesday','Thursday',
      'Friday', 'Saturday'
    ];

    var monthName = [
      'january', 'February', 'March', 'April', 'May', 'June', 'Juli',
      'August', 'September', 'Octuber', 'November', 'Dicember'
    ];

    pWeekendDay.textContent = weekend[weekendDay];
    pDay.textContent = day;

    pMonth.textContent = monthName[month];
    pYear.textContent = year;
    pHours.textContent = hours;
    pMinutes.textContent = minutes;
    
  };

  updateHour();

});
