$(document).ready () ->

	if $('div').hasClass('events')
		_h.loader true
		
		collection = new Ecommunity.Collections.Events()

		$('.panel-body').html ''
		
		collection.fetch().then () ->

			indexView = new Ecommunity.Views.Events_Index({ collection: collection })
			indexView.render()

			_h.loader false
