# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.cart-container').glysellinCart()
  $('.products-recap-form.editable').glysellinAsyncCart()
  $('.addresses-fields-container').glysellinAddress()

  $('.wizard ul.steps > li[data-url]').on "click", (e) ->
    window.location.href = $(this).data('url')
