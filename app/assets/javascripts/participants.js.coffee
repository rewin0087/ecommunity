$(document).ready () ->

	if $('div').hasClass('participants')
		_h.loader true
		
		collection = new Ecommunity.Collections.Participants()

		$('.panel-body').html ''
		
		collection.fetch().then () ->

			indexView = new Ecommunity.Views.Participants_Index({ collection: collection })
			indexView.render()

			_h.loader false