# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on('ajax:success', '#new_checkout_product', (e, data, status, xhr) ->
    $("#scans").append("<li>" + data['value'] + " " + data['product']['code'] + " (" + data['product']['price'] + ")" + "</li>")
    $("#scans").effect("highlight")
    $("#checkout_total").effect("highlight")
    $("#checkout_total").html(data['total'])
    $("#new_checkout_product")[0].reset()
  ).on("ajax:error", (e, data, status, xhr) ->
    $("#new_checkout_product").render_form_errors('scan', data.responseJSON)
  )