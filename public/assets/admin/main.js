(function() {
  $(function() {
    $('#lightgallery').lightGallery({
      selector: '.item'
    });
    return $('.button-collapse').sideNav();
  });

}).call(this);
