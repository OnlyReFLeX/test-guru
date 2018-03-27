document.addEventListener('turbolinks:load', function() {
  var timer_seconds = document.querySelector('.timer');
  if (timer_seconds) {
    var time = timer_seconds.dataset.timeleft;
    setInterval(function () {
      if (time > 0) {
        time -= 1;
      } else {
        alert('У вас вышло время');
        document.querySelector('form').submit();
      }
      result = parseInt(time / 60) + ':' + time % 60;
      timer_seconds.innerHTML = result;
    }, 1000)
  };
});
