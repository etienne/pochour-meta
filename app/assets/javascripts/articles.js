$(function() {
  // Highlight comments
  if (window.location.hash) {
    $(window.location.hash).addClass('highlighted')
    setTimeout(function () {
      $(window.location.hash).removeClass('highlighted')
    }, 2000);
  }
  
  // Handle epithets
  $("#epithets-list a[data-remote]").on("ajax:success", function(e, data, status, xhr) {
    Turbolinks.visit(window.location.href, { change: ['epithets-list'], scroll: false })
  });
})