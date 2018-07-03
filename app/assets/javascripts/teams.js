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

    if (hours >= 12) {
      hours = hours - 12;
      ampm = 'PM';
    }else {
      ampm = 'AM'
    }

    if (hours == 0) {
      hours = 12;
    };

    if (hours < 10) {
      hours = "0" + hours
    };
    if (minutes < 10) {
      minutes = "0" + minutes
    };
    if (seconds < 10) {
      seconds = "0" + seconds
    };

    pWeekendDay.textContent = weekend[weekendDay];
    pDay.textContent = day;

    pMonth.textContent = monthName[month];
    pYear.textContent = year;
    pHours.textContent = hours;
    pMinutes.textContent = minutes;
    pAMPM.textContent = ampm;
    pSeconds.textContent = seconds;

  };

  updateHour();
  var interval = setInterval(updateHour, 1000);

});
