$(function(){
  $('.input--price__default').on('input', function(){
    var data = $('.input--price__default').val();
    var profit = Math.round(data * 0.9)
    var fee = (data - profit)
    $('.l-right3').html(fee)
    $('.l-right3').prepend('¥')
    $('.l-right2').html(profit)
    $('.l-right2').prepend('¥')
    $('#price2').val(fee)
    $('#price').val(profit)
    if(profit == '') {
    $('.l-right2').html('');
    $('.l-right3').html('');
    }
  })
})