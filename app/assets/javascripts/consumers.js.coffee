# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->  
  $('.cf-slide-2-toggle').click ->
    $('.slide-2').show();
    $('.slide-1').hide();
    $('.cf-slide-toggle').removeClass('active');
    $('.cf-slide-2-toggle').addClass('active');
  $('.cf-slide-1-toggle').click ->
    $('.slide-1').show();
    $('.slide-2').hide();
    $('.cf-slide-toggle').removeClass('active');
    $('.cf-slide-1-toggle').addClass('active');