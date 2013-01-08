# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 	
	$('input#order_product').autocomplete({
		source: "/e_combos/search_on_p"
		minLength: 1, delay: 500,
		select: (event,ui) ->
			$.get('/orders/search_suppliers',{id: ui.item.value.id},llenar_combo)
			$('input#order_product').val(ui.item.label)
			$('input#order_product_id').val(ui.item.value.id)
			return false
		,
		focus: (event,ui) ->
			return false
	})
	$("#order_enviar").click(()->
		if !validar()
			alert "Falta llenar campos o uno de los campos es incorrecto"
			return false

		row = document.createElement("tr")
		i = $("#order_lista").children()[0].children.length
		row.id = "fila" + i;
		row.innerHTML =
					"<td>" + $("#order_product").val() + "<input name='order[" + i + "][product]' type='hidden' value='" + $("#order_product_id").val() + "'></td>
					<td>" + $("#cantidad").val() + "<input name='order[" + i + "][cantidad]' type='hidden' value='" + $("#cantidad").val() + "'></td>
					<td>" + $("#factura").val() + "<input name='order[" + i + "][factura]' type='hidden' value='" + $("#factura").val() + "'></td>
					<td>" + $("#supplier_combobox option:selected").text() + "<input name='order[" + i + "][supplier]' type='hidden' value='" + $("#supplier_combobox").val() + "'></td>
					<td><a href='#' class='btn' onclick='$(\"#fila" + i + "\").html(\"\")'>Eliminar</a></td>"
		$("#order_lista").append(row)
	)

llenar_combo = (data)->$("#supplier_combobox_div").html(data)

validar =()->
	if $("#order_product_id").val() == ""
		return false
	if $("#cantidad").val() == "" or !(/^\d*$/).test($("#cantidad").val())
		return false
	if $("#factura").val() == ""
		return false
	if $("#supplier_combobox option:selected").text() == ""
		return false
	return true