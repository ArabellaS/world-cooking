ActiveAdmin.register Recipe do

  permit_params :content, :place_id, :name, :sourness, :spiciness, :saltiness, :savoriness, :sweetness, :bitterness, :fattiness, recipe_elements_attributes: [ :id, :_destroy, :ingredient_id, :amount, :unit ]

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :place, :as => :select, :collection => Place.collection, null: false
      f.input :content
      f.input :name
      f.input :sourness, input_html: {value: f.object.sourness || 3}
      f.input :spiciness, input_html: {value: f.object.spiciness || 3}
      f.input :saltiness, input_html: {value: f.object.saltiness || 3}
      f.input :savoriness, input_html: {value: f.object.savoriness || 3}
      f.input :sweetness, input_html: {value: f.object.sweetness || 3}
      f.input :bitterness, input_html: {value: f.object.bitterness || 3}
      f.input :fattiness, input_html: {value: f.object.fattiness || 3}
    end

      f.inputs "recipe_elements" do
        f.has_many :recipe_elements, heading: true, allow_destroy: true do |recipe_element|
          recipe_element.input :ingredient, :as => :select, :collection => Ingredient.collection, null: false
          recipe_element.input :amount, null: false, input_html: {value: recipe_element.object.amount || 150}
          recipe_element.input :unit, null: false, input_html: {value: recipe_element.object.unit || "grams"}
        end
      end
      f.actions
  end
end
