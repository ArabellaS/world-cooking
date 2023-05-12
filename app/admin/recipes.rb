ActiveAdmin.register Recipe do

  permit_params :content, :place_id, :name, :sourness, :spiciness, :saltiness, :savoriness, :sweetness, :bitterness, :fattiness, quantities_attributes: [ :id, :_destroy, :ingredient_id, :amount, :unit ]

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :place, :as => :select, :collection => Place.collection, null: false
      f.input :content
      f.input :name
      f.input :sourness
      f.input :spiciness
      f.input :saltiness
      f.input :savoriness
      f.input :sweetness
      f.input :bitterness
      f.input :fattiness
    end

      f.inputs "quantities" do
        f.has_many :quantities, heading: true, allow_destroy: true do |quantity|
          quantity.input :ingredient, :as => :select, :collection => Ingredient.collection, null: false
          quantity.input :amount, null: false
          quantity.input :unit, null: false
        end
      end
      f.actions
  end
end
