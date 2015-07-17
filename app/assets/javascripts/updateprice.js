$(document).ready(function(){
  $('#purchaseitemquantity').change(function(){
    var $price = parseInt($('#dealprice').text()) * parseInt($('#purchaseitemquantity').val());
    $price = $price.toString();
    $('#purchaseitemprice').html($price);
  })
})