class Ecommunity.Views.Join_Index extends Backbone.View
	el: '.content'
	selected_event: null

	events: () ->
		{
			'click .join-btn' : 'join'
			'click .select-course-btn' : 'showSelectCourseModal'
		}

	showSelectCourseModal: () =>
		# get target DOM
		targetDOM = $('#selection-course')
		# initialize modal
		modal = new Ecommunity.Views.Select_Course_View({ collection: @collection })
		modal.parent = @
		# append to DOM
		targetDOM.html modal.render().el

		@ 

	render: () =>
		
		@clearErrors()

		@

	join: (e) =>
		e.preventDefault()
		# clear errors
		@clearErrors()
		# show loader
		_h.loader true
		# get form
		form = @$el.find('form')
		# serialize form
		data = _h.serializeForm form
		# initialize model
		model = new Ecommunity.Models.Participant(data)
		# set url
		model.urlRoot = '/api/participant'
		# set selected event
		model.set('event_id', @selected_event)
		# save
		model.save [],
			success: @success
			error: @error
		@

	clearErrors: () =>
		error_field = $('.error')
		error_field.removeClass('show-error')
		error_field.html ''

		@ 

	success: (res, model) =>
		# hide loader
		_h.loader false
		# initialize model
		eventModel = new Ecommunity.Models.Event(model)
		# initialize done registration view
		doneRegistrationView = new Ecommunity.Views.Done_Registration({ model: eventModel })
		# replace view to done
		@$el.html doneRegistrationView.render().el

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

			if i == 'full_name'
				error_field.html "Full Name " + v

			else if i == 'event_id'
				error_field.html v

			else
				error_field.html i + " " + v
		)
		
		@