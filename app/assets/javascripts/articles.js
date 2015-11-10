$(document).on('page:change', function(event) {
  // Highlight comments
  if (window.location.hash) {
    $(window.location.hash).addClass('highlighted')
    setTimeout(function () {
      $(window.location.hash).removeClass('highlighted')
    }, 2000);
  }
  
  // Handle epithets
  $("#epithets-list").after($('<div class="popup-menu" id="epithet-popup">a</div>'));
  $("#epithets-list li[data-users]").hover(function() {
    $("#epithet-popup").html($(this).data('users')).fadeIn(100);
    positionMenu($("#epithet-popup"), $(this).find('a'));
  }, function() {
    $("#epithet-popup").fadeOut(100);
  });
  
  $("#epithets-list a[data-remote]").on("ajax:success", function(e, data, status, xhr) {
    Turbolinks.visit(window.location.href, { change: ['epithets-list'], scroll: false })
  });
  
  $("#new_epithet_vote").on("ajax:success", function(e, data, status, xhr) {
    $('#epithets-menu').fadeOut(200); // Not very DRY
    Turbolinks.visit(window.location.href, { change: ['epithets-list'], scroll: false })
  }).on("ajax:error", function(e, xhr, status, error) {
    console.log("Couldn't create new epithet vote: " + error);
  })
  
  // Autofocus
  $('a[data-popup=epithets-menu]').click(function() {
    if ($('#epithets-menu').is(":visible")) {
      $('#epithet_vote_epithet_name').focus().val('');
    }
  });
  
  // Handle AJAX comment form
  $('#comment_body').val('');
  $("#new_comment").on("ajax:success", function(e, data, status, xhr) {
    Turbolinks.visit(window.location.href, { change: ['comments-list'], scroll: false })
  }).on("ajax:error", function(e, xhr, status, error) {
    console.log("Couldn't create new comment: " + error);
  })
})