// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require bootstrap-datepicker
//= require sync
//= require_tree .
var vendor_slide_submited;
$(document).ready(function(){
  $('.custom-scroll').mCustomScrollbar({mouseWheel:{ deltaFactor: 100 }});
});

saveForm = function(slide) {
  $('#loadmodal').show();
  if (slide === 'slide-1') {
    vendor_slide_submited = 'slide-1';
    $('.edit_vendor').submit();
  } else if (slide === 'slide-2') {
    vendor_slide_submited = 'slide-2';
    $('.edit_vendor').submit();
  } else if (slide === 'slide-4') {
    vendor_slide_submited = 'slide-4';
    $('.edit_user').submit();
  }
};