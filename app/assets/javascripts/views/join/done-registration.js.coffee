class Ecommunity.Views.Done_Registration extends Backbone.View
	template: '#done-registration'

	events: () ->
		{
			'click .fb-share-button' : 'share'
		}

	render: () =>
		template = _.template($(@template).html())
		
		@$el.html template()

		# set data
		@$el.find('#name').html @model.get('event').name
		@$el.find('#date').html @model.get('event').date_time
		
		# @$el.find('#venue').html @model.get('venue')
		
		@

	share: (e) =>
		console.log @model
		e.preventDefault()
		fb_button = @$el.find('.fb-share-button')

		fb_link = fb_button.attr('data-href') + '/' + @model.get('full_name') + '/' + @model.get('id') + '/registered'

		window.open('https://www.facebook.com/sharer/sharer.php?u=' + fb_link, '_blank', 'width=600px, height=170px, resizable=0, menubar=0, titlebar=0, toolbar=0, left=300, top=100')
