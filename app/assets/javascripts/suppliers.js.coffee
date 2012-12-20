# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 	
	$('input#supplier_product').autocomplete({
		source: "/e_combos/search_on_p"
		minLength: 1, delay: 500,
		select: (event,ui) ->
			$('input#supplier_product').val(ui.item.label)
			$('input#supplier_product_id').val(ui.item.value.id)
			return false
		,
		focus: (event,ui) ->
			return false
	})
	$("#supplier_enviar").click(()->
		lista = $("#supplier_lista")
		lista.append(
					"<li id='p" + $("#supplier_product_id").val() + "'>" + $("#supplier_product").val() + "<input name='products[" + $("#supplier_product_id").val() + "]' type='hidden' value='" + $("#supplier_product_id").val() + "'>&nbsp;&nbsp;<a href='#' class='btn' onclick='$(\"#p" + $("#supplier_product_id").val() + "\").remove()'>Eliminar</a></li>")
		$("#supplier_product").val("")
	)