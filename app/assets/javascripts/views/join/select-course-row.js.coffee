class Ecommunity.Views.Select_Course_Row extends Backbone.View
	template: JST['join/select-course-row']
	parent: null

	events: () ->
		{
			'click .select' : 'selected'
		}

	selected: (e) =>
		e.preventDefault() 
		$('.course').removeClass('course-selected')

		# set event id to selected_event
		@parent.selected_event = @model.get('id')

		setTimeout () =>
			@$el.find('.course').addClass('course-selected')
		, 100

		@

	render: () =>

		@$el.html @template(@model.toJSON())

		@