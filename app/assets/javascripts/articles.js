$(document).on('page:change', function(event) {
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
  
  $("#new_epithet_vote").on("ajax:success", function(e, data, status, xhr) {
    $('#epithets-menu').fadeOut(200); // Not very DRY
    Turbolinks.visit(window.location.href, { change: ['epithets-list'], scroll: false })
  }).on("ajax:error", function(e, xhr, status, error) {
    console.log("Couldn't create new epithet vote: " + error);
  })
})