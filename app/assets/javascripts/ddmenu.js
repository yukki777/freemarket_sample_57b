$(document).ready(function(){
  //カテゴリー

  $('.header__content__down__left__ddmenu-start').hover(function(){
    $(this).addClass('active');
    var children = $('.active').children('.header__content__down__left__ddmenu-start__parent');
    children.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.header__content__down__left__ddmenu-start__parent').hide();
  });

  $('.parent').hover(function(){
    $(this).addClass('active2');
    var grandChild = $('.active2').children('.header__content__down__left__ddmenu-start__parent__child');
    grandChild.show();
  },function(){
    $(this).removeClass('active2');
    $(this).children('.header__content__down__left__ddmenu-start__parent__child').hide();
  });

  $('.child').hover(function(){
    $(this).addClass('active2');
    var grandChild = $('.active2').children('.header__content__down__left__ddmenu-start__parent__child__grand');
    grandChild.show();
  },function(){
    $(this).removeClass('active2');
    $(this).children('.header__content__down__left__ddmenu-start__parent__child__grand').hide();
  });

  //ブランド
  $('.header__content__down__left__brand').hover(function(){
    $(this).addClass('active3');
    var grandChild = $('.active3').children('.header__content__down__left__brand__list');
    grandChild.show();
  },function(){
    $(this).removeClass('active3');
    $(this).children('.header__content__down__left__brand__list').hide();
  });
  
});