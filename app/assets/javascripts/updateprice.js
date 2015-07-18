$(document).ready(function(){
  $('#purchaseitemquantity').change(function(){
    var $price = parseFloat($('#dealprice').text()) * parseInt($('#purchaseitemquantity').val());
    $price = $price.toFixed(2).toString();

    $('#purchaseitemprice').html($price);
  })
})
