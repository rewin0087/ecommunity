$(document).ready () ->

	if $('div').hasClass('join')

		collection = new Ecommunity.Collections.Events()

		collection.fetch().then () ->
			
			indexView = new Ecommunity.Views.Join_Index({ collection: collection })
			indexView.render()
