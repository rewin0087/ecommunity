class Ecommunity.Views.Participant_Table extends Backbone.View
	template: JST['participants/table']

	render: () =>

		@$el.html @template()

		@collection.each(@addOne, @)

		@

	addOne: (model) =>
		# initialize view
		rowView = new Ecommunity.Views.Participants_Row({ model: model })
		# append to DOM
		@$el.find('tbody').append(rowView.render().el)

		@