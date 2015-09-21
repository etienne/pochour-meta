$(function() {
  // Fade out notices
  setTimeout(function () {
    $('div.notice').fadeOut(1000);
  }, 1500);
  
  // Activate in-place editor
  $(".best_in_place").best_in_place();
  
  // Activate WYSIWYG editor
  if ($('#editor').length) {
    console.log('init editor');
    window.editor = new wysihtml5.Editor('editor', {
      toolbar: 'toolbar',
      parserRules: wysihtml5ParserRules,
      contentEditableMode: true,
      useLineBreaks: false
    });
  
    // Force line breaks when pressing Shift-Enter in Safari
    window.editor.on("load", function() {
      $('.wysihtml5-editor').keydown(function(event) {
        if (event.keyCode == 13 && event.shiftKey) {
          event.preventDefault();
          window.editor.composer.commands.exec("insertLineBreak");
        }
      });
    });
  }
  
  // Handle popup menus
  $('.popup-menu-link').mousedown(function() {
    $('.popup-menu').fadeOut(100);
    var popup_menu = $('#' + $(this).attr('data-popup'));
    popup_menu.fadeToggle(100);
    
    if (popup_menu.is(':visible')) {
      $(popup_menu).css({
        transform: "translate(0, 0)"
      })
      
      var calculator = new $.PositionCalculator({
        item: popup_menu,
        itemAt: "top center",
        target: this,
        targetAt: "bottom center",
        flip: "both"
      });
      var position = calculator.calculate();

      popup_menu.css({
        transform: "translate(" + position.moveBy.x + "px, " + (position.moveBy.y + 14) + "px)"
      })
    }
  });
  
  $(document).mousedown(function(event) {
    if (!$(event.target).closest('.popup-menu, .popup-menu-link').length) {
      if ($('.popup-menu').is(":visible")) {
        $('.popup-menu').fadeOut(200);
      }
    }
  });
})
