
$ ->	
	$('#vendor-picture.no-url').click ->
		$('.file-upload-hidden').trigger('click');
	$('.dropdown-toggle').dropdown()
	$('.bid-links > .link').click ->
		target = $(this).attr("target")
		$(target).toggleClass('hidden')
	$('.current-filter').click ->
		$('.filter-options').show();
		# ...
	$('.target-bid-history').click ->
		target = $(this).attr("target")
		$(this).parent().children('.bid-group-set').addClass('hidden')
		$("."+target).removeClass('hidden')