class Ecommunity.Views.Events_Row extends Backbone.View
	template: JST['events/row']
	tagName: 'tr'

	initialize: () =>
		 @model.on 'destroy', @unRender, @

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
		@

	unRender: () =>
		# remove from html this current record
        @remove()

	error: () =>
		
		_h.loader false
		# get errors
		errors = response.responseJSON.error