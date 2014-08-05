class Ecommunity.Views.Participants_Row extends Backbone.View
	template: JST['participants/row']
	tagName: 'tr'

	render: () =>

		@$el.html @template(@model.toJSON())
		
		@