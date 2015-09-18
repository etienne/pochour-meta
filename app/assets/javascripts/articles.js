$(function() {
  // Highlight comments
  if (window.location.hash) {
    $(window.location.hash).addClass('highlighted')
    setTimeout(function () {
      $(window.location.hash).removeClass('highlighted')
    }, 2000);
  }
})