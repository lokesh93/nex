# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.file-upload-btn').click ->
    $(this).children('input').click();
  $('.file-upload-btn').children('span').dotdotdot()
  $(document).on 'click', '.destroy-attachment', ->
    $(this).parent().remove();
jQuery ->
  $('#attachment_image').attr('name','attachment[image]')
  $('.new_attachment').each ->
    $(this).fileupload
      dataType: 'script'
      add: (e, data) ->
        types = /(\.|\/)(gif|jpe?g|png|mov|mpeg|mpeg4|avi)$/i
        file = data.files[0]
        if types.test(file.type) || types.test(file.name)
          # $('#new_attachment').append(data.context)
          data.formData = $(this).serializeArray()
          $(this).find('.file-upload-container').children('span').text(file.name)
          $(this).find('.file-upload-container').addClass('in-progress')
          setTimeout data.submit(), 3000
          $('#loadmodal').show();
        else
          alert("#{file.name} is not a gif, jpg or png image file")
      progress: (e, data) ->
        if data.context
          progress = parseInt(data.loaded / data.total * 100, 10)
          $('.progress-bar').css('width', progress + '%')
      done: (e, data) ->
        $('loadmodal').hide();
        $('.actions input[type="submit"]').off('click')
