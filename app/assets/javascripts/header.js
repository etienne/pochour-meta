$(function() {
  // Fade out notices
  setTimeout(function () {
    $('div.notice').fadeOut(1000);
  }, 1500);
  
  // Handle account menu
  $('.account-menu').click(function() {
    $('.account-menu-popup').fadeToggle(100);
    
    if ($('.account-menu-popup').is(':visible')) {
      $('.account-menu-popup').css({
        transform: "translate(0, 0)"
      })
      
      var calculator = new $.PositionCalculator({
        item: $('.account-menu-popup'),
        itemAt: "top center",
        target: this,
        targetAt: "bottom center",
        flip: "both"
      });
      var position = calculator.calculate();

      $('.account-menu-popup').css({
        transform: "translate(" + position.moveBy.x + "px, " + (position.moveBy.y + 14) + "px)"
      })
    }
  });
  
  $(document).click(function(event) {
    if (!$(event.target).closest('.account-menu-popup, .account-menu').length) {
      if ($('.account-menu-popup').is(":visible")) {
        $('.account-menu-popup').fadeOut(200);
      }
    }
  });
});
