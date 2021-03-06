$(document).on('page:change', function(event) {
  // Fade out notices
  setTimeout(function () {
    $('div.notice').fadeOut(1000);
  }, 1500);
  
  // Use timeago
  $.timeago.settings.cutoff = 7*24*60*60*1000; // 1 week
  $("time").timeago();
  
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
    positionMenu(popup_menu, this);
  });
  
  $(document).mousedown(function(event) {
    if (!$(event.target).closest('.popup-menu, .popup-menu-link').length) {
      if ($('.popup-menu').is(":visible")) {
        $('.popup-menu').fadeOut(200);
      }
    }
  });
})

// TODO: Should probably turn this into a jQuery extension
function positionMenu(item, anchor) {
  if (item.is(':visible')) {
    $(item).css({
      transform: "translate(0, 0)"
    })
    
    var calculator = new $.PositionCalculator({
      item: item,
      itemAt: "top center",
      target: anchor,
      targetAt: "bottom center",
      flip: "both"
    });
    var position = calculator.calculate();

    item.css({
      transform: "translate(" + position.moveBy.x + "px, " + (position.moveBy.y + 14) + "px)"
    })
  }
}