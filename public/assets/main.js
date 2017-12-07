(function() {
  $(function() {
    var contactMeForm;
    $('#lightgallery').lightGallery({
      selector: '.item'
    });
    $('.button-collapse').sideNav();
    $('.parallax').parallax();
    toastr.options.escapeHtml = false;
    toastr.options.progressBar = true;
    contactMeForm = $('form#contact_me-form');
    return contactMeForm.submit(function(e) {
      e.preventDefault();
      return $.ajax({
        type: 'POST',
        url: contactMeForm.attr('action'),
        data: contactMeForm.serialize(),
        success: function(data) {
          return toastr.success(data);
        },
        error: function(data) {
          return toastr.error(data.responseText);
        }
      });
    });
  });

}).call(this);
