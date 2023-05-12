ActiveAdmin.register Place do

  permit_params :lat, :lng, :city, :region, :country

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :city
      f.input :region
      f.input :country
    end
    f.actions
  end

end
