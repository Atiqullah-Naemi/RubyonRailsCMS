$(document).on('turbolinks:load', function() {
	var selectizeCallback = null;

	$('.post-category').on('hide.bs.modal', function(e) {
		if (selectizeCallback != null) {
			selectizeCallback();
			selectizeCallback = null;
		}
	});

	$('#new_category').on('submit', function(e) {
		e.preventDefault();
		$.ajax({
			method: "POST",
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(res) {
				selectizeCallback({
					value: res.id,
					text: res.name
				});
				selectizeCallback = null;

				$('.post-category').modal('toggle');
				$.rails.enableFormElements($('#new_category'));
			}
		});
	});

	$('.selectize').selectize({
		create: function(input, callback) {
			selectizeCallback = callback;

			$('.post-category').modal();
			$('#new_category').trigger('reset');
			$('#category_name').val(input);
		}
	});
});