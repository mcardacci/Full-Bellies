$(document).ready(function(){
  $('#purchaseitemquantity').change(function(){
    var $price = parseFloat($('#dealprice').text()) * parseFloat($('#purchaseitemquantity').val());
    $price = $price.toString();

    $('#purchaseitemprice').html($price);
  })
})