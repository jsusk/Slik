# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 	
	$('input#product_name').autocomplete({
		source: "/products/search_on_product"
		minLength: 2, delay: 500,
		select: (event,ui) ->
			$('input#product_name').val(ui.item.label)
			datos = new Object()
			datos.label = ui.item.label
			datos.value = ui.item.value
			$('input#product_id').val(JSON.stringify(datos))
			return false
		,
		focus: (event,ui) ->
			return false
	})

