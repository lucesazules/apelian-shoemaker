ActiveAdmin.register Shoe do
  form do |f|
    f.inputs do
      f.input :article_number
      f.input :name
    end
    f.inputs do
      f.input :colors, :as => :check_boxes
      f.input :sizes,  :as => :check_boxes, :label_method => :number
    end
    f.buttons
  end
end
