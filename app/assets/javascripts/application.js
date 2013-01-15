// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.ui.autocomplete
//= require jquery.ui.datepicker
//= require bootstrap-alert
//= require bootstrap-dropdown
function add_fields(link,hidden ,association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  var valexp = new RegExp("#val","g");
  var nomexp = new RegExp("Product name","g");

  var datos = jQuery.parseJSON($("#"+hidden).val());
  
  content = content.replace(valexp,datos.value);
  content = content.replace(nomexp,datos.label); 
  $(".ui-autocomplete-input").val("")
  $(link).parent().after(content.replace(regexp, new_id));
}

function remove_fields(link){
  $(link).next("input[type=hidden]").val("1");
  $(link).closest(".item").hide();
}

