# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update_checkout_total = (data)->
    $("#checkout_original_total").effect("highlight")
    $("#checkout_original_total").html(data['total'])


$ ->
  $(document).on('ajax:success', '#new_checkout_product', (e, data, status, xhr) ->
    $("#scans").append("<li>" + data['value'] + " " + data['product']['code'] + " (" + data['product']['price'] + ")" + "</li>")
    $("#scans").effect("highlight")
    update_checkout_total data
    $("#new_checkout_product")[0].reset()
  ).on("ajax:error", '#new_checkout_product', (e, data, status, xhr) ->
    console.log(data.responseJSON)
    $("#new_checkout_product #error_explanation").show()
    $("#new_checkout_product #error_explanation").html(data.responseJSON)
  )
  $(document).on('ajax:success', '.unscan_link', (e, data, status, xhr) ->
    e.currentTarget.parentNode.remove()
    update_checkout_total data
  ).on("ajax:error",  '.unscan_link', (e, data, status, xhr) ->
#    $("#new_checkout_product").render_form_errors('scan', data.responseJSON)
  )  