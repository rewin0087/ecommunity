class Ecommunity.Views.Participants_Index extends Backbone.View
	el: '.participants'

	render: () =>

		if !!oTable
			oTable.fnDestroy()

		table = new Ecommunity.Views.Participant_Table({ collection: @collection })

		@$el.find('.panel-body').html table.render().el

		if !oTable
			oTable = $('#participant-table').dataTable
				'info' : false
				'iDisplayLength' : 30
				'bDestroy' : true

		@

	