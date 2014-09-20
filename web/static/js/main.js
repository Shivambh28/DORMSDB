$(function() {
	// scroll to search
	$('.searchbtn').on('click', function(e) {
		var target = $(this).data('target'),
			offsetTop = $(target).offset().top;
		
		$('html, body').animate({
			scrollTop : offsetTop - 90
		});

		e.preventDefault();
	});
});