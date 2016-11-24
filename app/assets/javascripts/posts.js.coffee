# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.open-bid-now').click ->
    id = $(this).attr('data-id')
    $('.post-id').val(id)
    $('#bid_now').modal('show')
# for the post form datepicker
  catindex = $('.category.active').attr('data-index')
  catindex = parseInt(catindex)
  if catindex > 4
    $('.view-more-cat .show-more').click()

  
  $('.datepicker').datepicker
    autoclose: true
  $('.post-your-own.next').click ->
    $('.slide-1').hide();
    $('.submit.slide-2').removeClass('slide-2')
    $('.slide-2').css('display','block')
  $('.add-img').click -> 
    $('.img-btn.non-hidden').click();
  $('.img-btn.non-hidden').change ->
    pictureName = $(this).val()
    $(this).removeClass('non-hidden')
    $('.next-imgs').append('<input class="img-btn non-hidden" id="images_" multiple="multiple" name="images[]" type="file">')
    pictureName = pictureName.replace('C:\\fakepath\\','')
    alert pictureName
  $(document).on 'click','.edit-next-post', ->
    target = $(this).attr('target');
    if target == ".edit.slide-2"
      $('.edit.slide-1').hide();
      $('.edit-back-post').attr('target','.edit.slide-1')
      $(this).attr('target','.edit.slide-3')
    else if target == ".edit.slide-3"
      $('.edit.slide-2').hide();
      $('.edit-back-post').attr('target','.edit.slide-2')
      $(this).attr('target','nil')
    $(target).show();

  $(document).on 'click','.edit-back-post', ->
    target = $(this).attr('target');
    if target == ".edit.slide-1"
      $('.edit.slide-2').hide();
      $('.edit-submit').attr('target','.edit.slide-2')
      $(this).attr('target','nil')
      $('.active-submit').hide();
      $('.edit-submit').show();
    else if target == ".edit.slide-2"
      $('.edit.slide-3').hide();
      $('.edit-submit').attr('target','.edit.slide-3')
      $(this).attr('target','.edit.slide-1')
      $('.active-submit').hide();
      $('.edit-submit').show();
    $(target).show();
    
  $(document).on 'click','.more-or-less', ->
    if $(this).hasClass('view-less')
      $('.rest-of-bids').slideUp('slow');
      $(this).removeClass('view-less')
      $(this).html('View More')
      $(this).addClass('view-more')
    else
      $('.rest-of-bids').slideDown('slow');
      $(this).addClass('view-less')
      $(this).html('View Less')
      $(this).removeClass('view-more')
  $('.more-or-less-comments').click ->
    if $(this).hasClass('view-less')
      $('.rest-of-comments').slideUp('slow');
      $(this).removeClass('view-less')
      $(this).html('View More')
      $(this).addClass('view-more')
    else
      $('.rest-of-comments').slideDown('slow');
      $(this).addClass('view-less')
      $(this).html('View Less')
      $(this).removeClass('view-more')
	$('.datepicker').datepicker();