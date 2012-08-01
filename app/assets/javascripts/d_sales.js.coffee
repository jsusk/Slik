# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 	
	$('input#search').autocomplete({
		source: "/e_combos/search_on_p_and_c"
		minLength: 2, delay: 500,
		select: (event,ui) ->
			$('input#search').val(ui.item.label)
			$('input#product_id').val(ui.item.value.id)
			$('input#product_type').val(ui.item.value.tipo)
			return false
		,
		focus: (event,ui) ->
			return false
	})

