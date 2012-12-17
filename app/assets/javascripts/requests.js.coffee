# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 	
	$('input#request_product').autocomplete({
		source: "/e_combos/search_on_p"
		minLength: 2, delay: 500,
		select: (event,ui) ->
			$('input#request_product').val(ui.item.label)
			$('input#request_product_id').val(ui.item.value.id)
			return false
		,
		focus: (event,ui) ->
			return false
	})

