/**
 * Very simple basic rule set
 *
 * Allows
 *    <i>, <em>, <b>, <strong>, <p>, <div>, <a href="http://foo"></a>, <br>, <span>, <ol>, <ul>, <li>
 *
 * For a proper documentation of the format check advanced.js
 */
var wysihtml5ParserRules = {
  tags: {
    strong: {},
    b: {
      "rename_tag": "strong"
    },
    em: {},
    i: {
      "rename_tag": "em"
    },
    br: {},
    p: {},
    ul: {},
    ol: {},
    li: {},
    h2: {},
    a:      {
      set_attributes: {
        target: "_blank",
        rel:    "nofollow"
      },
      check_attributes: {
        href:   "url" // important to avoid XSS
      }
    }
  }
};