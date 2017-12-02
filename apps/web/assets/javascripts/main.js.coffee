$ ->
  $('#lightgallery').lightGallery()

  $('.button-collapse').sideNav()
  $('.parallax').parallax()

  toastr.options.escapeHtml = false
  toastr.options.progressBar = true

  contactMeForm = $('form#contact_me-form')
  contactMeForm.submit (e) ->
    e.preventDefault()
    $.ajax({
      type: 'POST'
      url: contactMeForm.attr('action')
      data: contactMeForm.serialize()
      success: (data) ->
        toastr.success(data)
      error: (data) ->
        toastr.error(data.responseText)
    })
