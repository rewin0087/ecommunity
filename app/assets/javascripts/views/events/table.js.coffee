class Ecommunity.Views.Event_Table extends Backbone.View
	template: JST['events/table']

	render: () =>

		@$el.html @template()

		@collection.each(@addOne, @)

		@

	addOne: (model) =>
		# initialize view
		rowView = new Ecommunity.Views.Events_Row({ model: model })
		# append to DOM
		@$el.find('tbody').append(rowView.render().el)

		@