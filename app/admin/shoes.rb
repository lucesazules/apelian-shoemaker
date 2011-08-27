ActiveAdmin.register Shoe do

  show :title => :name do
    panel I18n.t('admin.shoes.show.colors') do
      ul do
        shoe.colors.each do |color|
          li color.name
        end
      end
    end
    panel I18n.t('admin.shoes.show.sizes') do
      ul do
        shoe.sizes.each do |size|
          li size.number
        end
      end
    end
  end

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
