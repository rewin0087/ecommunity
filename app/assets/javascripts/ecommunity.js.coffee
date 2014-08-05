window.Ecommunity =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	initialize: ->
		
class Ecommunity.Helper

	#
    # Form Serializer
    #
    # e.g _h.serializeForm form
    #
	serializeForm: (form) ->
        # declare empty object
        data = {}
        # serialize form
        formData = form.serializeArray() 
        # extract data from each object and push to data object
        $.each(formData, () -> 
            if (data[this.name])
                if (!data[this.name].push)
                    data[this.name] = [data[this.name]]
                
                data[this.name].push(this.value || '')
            else
                data[this.name] = this.value || ''
        )
        # return serialize data
        data

    # ajax loader
    #
    # e.g to show: _h.loader true
    # e.g to hide: _j.laoder false
    loader: (show) ->
        if show == true
            $('.loader').fadeIn()
        else if show == false
            $('.loader').fadeOut()

$(document).ready ->
	# initialize backbone events
	
  	Ecommunity.initialize()
  	window._h = new Ecommunity.Helper()
  	window._v = _.extend( {}, Backbone.Events)
	Backbone.history.start()


$('a').on('click', (e) ->
    e.preventDefault()
    
    if !!$(@).attr('href')
        console.log $(@).attr('href') 
        window.location.href = $(@).attr('href') 
)
    

