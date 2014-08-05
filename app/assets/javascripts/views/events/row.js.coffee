class Ecommunity.Views.Events_Row extends Backbone.View
	template: JST['events/row']
	tagName: 'tr'

	events: () ->
		{
			'click .destroy' : 'destroy'
		}

	render: () =>

		@$el.html @template(@model.toJSON())
		
		@

	destroy: () =>

		_h.loader true

		@model.destroy
			success: @success
			error: @error

		@

	success: () =>

		_h.loader false

		@remove

		@

	error: () =>
		
		_h.loader false
		# get errors
		errors = response.responseJSON.error