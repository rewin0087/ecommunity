class Ecommunity.Views.Events_Index extends Backbone.View
	el: '.events'

	events: () ->
		{
			'click .show-add-modal' : 'showAddModal'
		}
	
	
	render: () =>

		table = new Ecommunity.Views.Event_Table({ collection: @collection })

		@$el.find('.panel-body').html table.render().el
		
		$('#event-table').dataTable
			'info' : false
			'iDisplayLength' : 30
			'bDestroy' : true

		@

	showAddModal: (e) =>
		e.preventDefault()

		addModal = new Ecommunity.Views.Events_Add_Modal({ collection: @collection })

		date_time_field = $('#date_time')
		date_time_field.fdatetimepicker( format: 'MM dd, yyyy hh:ii P')

		@