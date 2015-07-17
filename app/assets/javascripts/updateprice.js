$(document).ready(function(){
  $('#purchaseitemquantity').change(function(){
    var $price = parseInt($('#dealprice').text()) * parseInt($('#purchaseitemquantity').val());
    debugger
    $price = $price.toString();
    $('#purchaseitemprice').html($price);
  })
})