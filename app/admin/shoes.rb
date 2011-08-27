ActiveAdmin.register Shoe do

  show :title => :name do
    h2 shoe.campaign
    panel I18n.t('admin.shoes.show.characteristics') do
      div :style => "float:left"  do
        h3 I18n.t('shoe.heel')
        ul li shoe.heel
      end
      div :style => "float:left" do
        h3 I18n.t('shoe.colors')
        ul do
          shoe.colors.each do |color|
            li color.name
          end
        end
      end
      div :style => "float:left" do
        h3 I18n.t('shoe.sizes')
        ul do
          shoe.sizes.each do |size|
            li size.number
          end
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
      f.input :year, :as => :select, :collection => 1900..2100, :include_blank => false
      f.input :season_name, :as => :select, :collection => Shoe::SEASON_NAMES, :include_blank => false
      f.input :heel, :as => :select, :collection => Shoe::HEELS, :include_blank => false
      f.input :colors, :as => :check_boxes
      f.input :sizes,  :as => :check_boxes, :label_method => :number
    end
    f.buttons
  end
end
