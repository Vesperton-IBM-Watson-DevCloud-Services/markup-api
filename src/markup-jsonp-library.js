var MarkupAPI = MarkupAPI || {};

(function($) {
  MarkupAPI.insertStyles = function(styles) {
    var open  = '<style type="text/css" media="all">';
    var close = '</style>';

    return open + styles + close;
  };

  MarkupAPI.render = function(data) {
    $('head').append(
      MarkupAPI.insertStyles(data.nav.css),
      MarkupAPI.insertStyles(data.footer.css)
    );

    $('#markup-api-nav-target').append(data.nav.html);
    $('#markup-api-footer-target').append(data.footer.html);
  };
}(jQuery));
