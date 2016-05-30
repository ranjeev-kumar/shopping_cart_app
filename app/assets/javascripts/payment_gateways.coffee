# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment_gateway.setupForm()

payment_gateway =
  setupForm: ->
    $('#new_payment_gateway').submit ->
      $('input[type=submit]').attr('disabled', true)
      payment_gateway.processCard()
      false

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, payment_gateway.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      token = response.id;
      $('#new_payment_gateway').append($('<input type="hidden" name="stripeToken" />').val(token));
      $('#new_payment_gateway').get(0).submit();
      alert("Payment done successfully.")
    else
        $('#stripe_error').text(response.error.message)
        $('input[type=submit]').attr('disabled', false)
        console.log("Unsuccess")
