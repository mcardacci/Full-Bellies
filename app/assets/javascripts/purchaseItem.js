$(document).ready(function() {
  $('.purchase-button').on('click', renderPurchaseForm)
});

var renderPurchaseForm = function(event) {
  event.preventDefault();
  var $target = $(event.target)
  $.ajax({
    url : $target.attr('href'),
  }).done(function(form) {
    $('#purchase-form-area').append(form)
    $('.purchase-button').hide();
    $('#purchaseitemquantity').change(function(){
      var $price = parseFloat($('#dealprice').text()) * parseInt($('#purchaseitemquantity').val());
      $price = $price.toFixed(2).toString();
      $('#purchaseitemprice').html($price);
    })
  }).fail(function(error) {
    console.log("bad things")
  });
};
