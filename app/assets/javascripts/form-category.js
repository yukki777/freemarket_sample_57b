$(document).ready(function(){


  $('.select-wrap__defaultcategory').hover(function(){
    $(this).addClass('form-active');
    var children = $('.form-active').children('select.select-wrap-child__defaultcategory-child');
    children.show();
  });

  $('.select-wrap__defaultcategory').on('click',function() {
    $('.select-wrap-child').addClass('form-active');
    $('.select-wrap__defaultcategory-child').addClass('form-active');
    $('.childfa').addClass('form-active');
  });

  $('.select-wrap-child__defaultcategory-child').hover(function(){
    $(this).addClass('form-active');
    var grandchildren = $('.form-active').children('select.select-wrap-grandchild__defaultcategory-grandchild');
    grandchildren.show();
  });

  $('select.select-wrap-child__defaultcategory-child').on('click',function() {
    $('.select-wrap-grandchild').addClass('form-active');
    $('.select-wrap-grandchild__defaultcategory-grandchild').addClass('form-active');
    $('.grandfa').addClass('form-active');
  });

});
