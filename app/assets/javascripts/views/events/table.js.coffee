class Ecommunity.Views.Event_Table extends Backbone.View
	template: JST['events/table']

	initialize: () ->
		@collection.on 'add', @addOne, @

	render: () =>

		@$el.html @template()

		@$el.find('tbody').html ''
		
		@collection.each(@addOne, @)
		
		@

	addOne: (model) =>
		# initialize view
		rowView = new Ecommunity.Views.Events_Row({ model: model })
		# append to DOM
		@$el.find('tbody').append(rowView.render().el)

		@