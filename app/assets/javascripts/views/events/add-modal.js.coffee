class Ecommunity.Views.Events_Add_Modal extends Backbone.View
	el: '#add-event'

	events: () ->
		{
			'click .save' : 'save'
		}

	render: () =>

		@clearErrors()
		
		@

	clearErrors: () =>
		error_field = $('.error')
		error_field.removeClass('show-error')
		error_field.html ''

		@ 

	save: () =>
		console.log 'save'
		@clearErrors()
		# get form
		form = @$el.find('form')
		# serialize data
		data = _h.serializeForm form
		# show loader
		_h.loader true

		@collection.create(
			data,

			{ wait: true, success: @success, error: @error }
		)

		@

	success: () =>

		$('.dataTables_empty').remove()
		# hide loader
		_h.loader false
		# hide loader
		$('#add-event').foundation('reveal', 'close')

		form = @$el.find('form')[0].reset()

		@

	error: (model, response) =>
		# hide loader
		_h.loader false
		# get errors
		errors = response.responseJSON.error
		# show errors
		$.each(errors, (i, v) =>
			error_field = $('.error_' + i)
			error_field.addClass('show-error')
			error_field.html i + " " + v
		)

		@
