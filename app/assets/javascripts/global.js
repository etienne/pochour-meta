$(function() {
  if ($('#editor').length) {
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
})
