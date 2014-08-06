class Ecommunity.Views.Select_Course_View extends Backbone.View
	template: JST['join/select-course']
	parent: null

	render: () =>

		@$el.html @template

		@$el.find('.selections').html ''

		@collection.each @addOne, @
		
		@

	addOne: (model) =>

		rowView = new Ecommunity.Views.Select_Course_Row({ model: model })
		rowView.parent = @parent

		@$el.find('.selections').append(rowView.render().el)
