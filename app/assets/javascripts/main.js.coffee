$ ->
  # $(document).on 'click','.non-active-not', ->
  #   if !$(this).hasClass('read-false')
  #     $(this).addClass('active-not')
  #     $(this).removeClass('non-active-not')
  #     $('.fa-bell-o').addClass('hidden')
  #     $('.fa-bell').removeClass('hidden')

  $(document).on 'click','.read-false', ->
    $(this).removeClass('read-false')
    $(this).addClass('read-true')
    $('.fa-bell-o').removeClass('new')
    $('.fa-bell').removeClass('new')
    $('.read-notifications').click();
    setTimeout (->
      $('.notification-card').removeClass('read_false')
      return
    ), 3000
  $('.view-more-cat span').click ->
    $('.view-more-cat .show-more').toggleClass('hidden')
    $('.view-more-cat .show-less').toggleClass('hidden')
    $('.categories').toggleClass('minimized')
  $('.small-img').click ->
    $('#full-img').modal('show')
    target = $(this).attr('data-id')
    $('.full-img[data-id="'+target+'"]').show()
  $('.img-option.active').click ->
    $('.full-img').hide();
    target = $(this).attr('data-target')
    $('.full-img[data-id="'+target+'"]').show()
  $("#full-img").on 'shown.bs.modal', ->
    $('.full-img').each ->
      children = $(this).children('span');
      children.each ->
        centerElm(this)
      $('.full-img').children('span').removeClass('hidden')
  $("#full-img").on 'show.bs.modal', ->
    $('.full-img').children('span').addClass('hidden')

  $("#full-img").on 'hide.bs.modal', ->
    $('.full-img').hide();
  $('.close_notice').on 'click', ->
    $('.notice').hide()
  $('*').click ->
  	if !($(this).hasClass('.notice'))
  		$('.notice').hide()
  		# ...
  	
  
centerElm = (elm) ->
  parentHeight = $(elm).parent().height()
  childHeight = $(elm).height()
  top = (parentHeight - childHeight)/2
  $(elm).css('margin-top',top)

$(window).scroll ->
  if $(window).scrollTop() + $(window).height() == $(document).height()
    $('#feedback-modal').modal('show');
  return