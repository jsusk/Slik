module ApplicationHelper
  def button_to_add_fields(name, hidden,f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, 
                          new_object,
                      :child_index => "new_#{association}") do |builder|
                      builder.hidden_field :product_id, :value => "#val"
    end 
    button_to_function name, 
      "add_fields(this,'#{hidden}','#{association}','#{escape_javascript(fields)}')"
  end
  
end
