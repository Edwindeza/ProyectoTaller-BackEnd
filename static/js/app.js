$(document).ready(function(){
  'use strict';
  /*$('.navbar-toggle').click(function(e) {
    e.preventDefault();
    $('.navbar-toggle').toggleClass('active');
    $('.nav_color').toggleClass('active');
  });*/

 // window.sr = new scrollReveal();
  
  var toggle3dBlock;
  toggle3dBlock = function(addOrRemove) {
    if (typeof addOrRemove === 'undefined') {
      addOrRemove = true;
    }
    $('.cd-header').toggleClass('nav-is-visible', addOrRemove);
  };
  $('.cd-3d-nav-trigger').on('click', function(e) {
    e.preventDefault();
    toggle3dBlock(!$('.cd-header').hasClass('nav-is-visible'));
    $('.cd-header, .b-moving, .nav_mobile, .btn-up, .fixed_social').toggleClass('active');
  });


  $('.btn-answer').click(function(){
    $(this).fadeOut('fast', function() {
      $(this).remove();
    });
  });
  
  $('.fixed_social > .btn-more').click(function(event) {
    var _sb = $(this).siblings('.nav');
    $(this).toggleClass('active');
    $(_sb).toggle();
  });


  $('.btn-lanswer').click(function(e) {
    e.preventDefault();
    var _id = $(this).attr('href');
    $(_id).slideToggle();
  });

  $(window).scroll(function(){
    var _scroll = $(window).scrollTop();
    //console.log(_scroll);
    if(_scroll >= 50){
      $('.bg_header').addClass('bg_color');
    } else {
      $('.bg_header').removeClass('bg_color');
    }
  });

  $( ".b_list" ).find('.title.h_collap').click(function() {
    $( this ).toggleClass( "updown" );
  });

}); 


    