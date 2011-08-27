ActiveAdmin.register Shoe do
  form do |f|
    f.inputs do
      f.input :article_number
      f.input :name
    end
    f.inputs do
      f.input :colors, :as => :check_boxes
    end
    f.buttons
  end
end
