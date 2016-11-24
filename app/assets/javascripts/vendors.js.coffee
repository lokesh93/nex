# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
slide1Status = 'saved'
slide2Status = 'saved'
slide3Status = 'saved'
slide4Status = 'saved'
$('.btn-save').click ->
  $('#loadmodal').show();
checkSlide = () ->
  if VendorSlide == 1
    $('.vendor-form-submit').click()
    $('#loadmodal').show();
    $('.prev-vendor-slide').addClass('hidden');
    $('.slide').hide();
    $('.slide-1').show();
    $('.next-vendor-slide').text('Next').removeClass('final-submit')
    $('.slide-info').attr('current-slide',1);
  if VendorSlide == 2
    $('.vendor-form-submit').click()
    $('#loadmodal').show();
    $('.prev-vendor-slide').removeClass('hidden');
    $('.slide').hide();
    $('.slide-2').show();
    $('.next-vendor-slide').text('Next').removeClass('final-submit')
    $('.slide-info').attr('current-slide',2);
  
  if VendorSlide == 3
    $('.prev-vendor-slide').removeClass('hidden');
    $('.slide').hide();
    $('.slide-3').show();
    $('.next-vendor-slide').text('Save Profile').addClass('final-submit')
    $('.slide-info').attr('current-slide',3);
    # ...


saveSlide = (slide) ->
  alert(slide)
notSavedSlide = (slide) ->
  $('.next-vendor-slide.next.'+slide).addClass('active');
  slide1Status = 'notsaved';
  $('.vf-'+slide+'-toggle').addClass('notsaved')
checkPostal = (code,letter) ->
  length = code.length
  length = length % 2

  if length == 1
    pCodePattern = new RegExp('[a-z]','i')
  else
    pCodePattern = new RegExp('[0-9]','i')
  if pCodePattern.test(letter)
    true
  else
    false
$ ->

  $(document).on 'click','.next-vendor-slide.active', ->
    slide = $(this).attr('data-slide')
    saveForm(slide)

  if $('.vendor-form').hasClass('new-false')
    $('.remove-p-location').last().trigger('click')
    # ...
  
  $('.postal').keyup (e)->
    letter = String.fromCharCode(e.which)
    code = $(this).val();
    if !(checkPostal(code,letter))
      code= code.slice(0,-1)
      $(this).val(code)

  $('.final-submit').click (e)->
    error = false;
    $('.required.first').each ->
      if $(this).val() == ""
        $(this).css('border','1px solid red')
        error = true
      else
        $(this).css('border','1px solid #ffc285')
        # ...
    if error
      e.preventDefault()
      
  $('.vendor-form').find('input').on 'change', ->
    slide = $(this).attr('data-slide')
    notSavedSlide(slide)
    console.log(slide + 'edited')
  $('.vendor-form').find('select').on 'change', ->
    slide = $(this).attr('data-slide')
    notSavedSlide(slide)
    console.log(slide + 'edited')
  $('.stars-raiting.form > img').click ->
    val = $('.stars-raiting.form > input ').val()
    $('.raiting').val(val)
  $('.read-more-des').click ->
    $('.description').removeClass('less')
    $(this).hide();
    $('.read-less-des').show();
  $('.read-less-des').click ->
    $('.description').addClass('less')
    $(this).hide();
    $('.read-more-des').show();
  $('.delivery-btn').click ->
    if $(this).hasClass('slideup')
      $('.delivery-locations').slideUp('slow')
      $(this).removeClass('slideup')  
    else
      $('.delivery-locations').slideDown('slow')
      $(this).addClass('slideup')
  $('.service-btn').click ->
    if $(this).hasClass('slideup')
      $('.service-locations').slideUp('slow')
      $(this).removeClass('slideup')  
    else
      $('.service-locations').slideDown('slow')
      $(this).addClass('slideup')
  $('.vf-slide-toggle').click ->
    $('.vf-slide-toggle').removeClass('active')
    $(this).addClass('active')
    if $(this).hasClass('vf-slide-1-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-4').hide()
      $('.slide-5').hide()
      $('.slide-1').css('display','inline-block')
    if $(this).hasClass('vf-slide-2-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-4').hide()
      $('.slide-5').hide()
      $('.slide-2').css('display','inline-block')
    if $(this).hasClass('vf-slide-3-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-4').hide()
      $('.slide-5').hide()
      $('.slide-3').css('display','inline-block')
      w = $('.media-gallery').width()
      ml = (w-660)/2
      $('.media-gallery').css('margin-left',ml)
      $('.media-gallery').find('.not-centered').css('margin-left',(-1*ml))
    if $(this).hasClass('vf-slide-4-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-4').hide()
      $('.slide-5').hide()
      $('.slide-4').css('display','inline-block')
    if $(this).hasClass('vf-slide-5-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-4').hide()
      $('.slide-5').hide()
      $('.slide-5').css('display','inline-block')

  $('.next-vendor-slide').click ->
    $('.required.first').each ->
      if $(this).val() == ""
        $(this).css('border','1px solid red')
        error = true
      else
        $(this).css('border','1px solid #ffc285')
    # VendorSlide = VendorSlide + 1;
    # checkSlide();
  
  $('.prev-vendor-slide').click ->
    VendorSlide = VendorSlide - 1;
    checkSlide();

  $('.slide-1.slide').find('input').each ->
    $(this)
  $('.file-upload-trigger').click ->
    $('.file-upload-hidden').trigger('click');
  $('.file-cover-trigger').click ->
    $('.file-cover-hidden').trigger('click');
  $('.file-media-trigger').click ->
    $('.file-media-hidden').trigger('click');
  $('.file-media-hidden').change ->
      num = $(this)[0].files.length
      msg = num + " IMAGES SELECTED FOR SHOW"
      $('.file-media-trigger > span').text(msg)
      $('.file-media-trigger').addClass('image-selected')
  $('#cover_pic_').change (e) ->
      msg = " Cover Picture: " + $(this).val().split("\\").pop()
      $('.file-cover-trigger > span').text(msg)
      $('.file-cover-trigger').addClass('image-selected')
  $('#profile_pic_').change (e) ->
    msg = "Profile Picture: " + $(this).val().split("\\").pop()
    $('.file-upload-trigger > span').text(msg)
    $('.file-upload-trigger').addClass('image-selected')
