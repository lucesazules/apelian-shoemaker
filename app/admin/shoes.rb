ActiveAdmin.register Shoe do

  show :title => :name do
    h2 shoe.campaign
    panel I18n.t('admin.shoes.show.characteristics') do
      table do
        tr do
          td do
            h3 I18n.t('shoe.heel')
            ul li shoe.heel
          end
          td do
            h3 I18n.t('shoe.colors')
            ul do
              shoe.colors.each do |color|
                li color.name
              end
            end
          end
          td do
            h3 I18n.t('shoe.sizes')
            ul do
              shoe.sizes.each do |size|
                li size.number
              end
            end
          end
        end
      end
    end

    panel "Photo" do
      ul do
        li image_tag shoe.photo.url
        li image_tag shoe.photo.url(:medium)
        li image_tag shoe.photo.url(:thumb)
      end
    end

    panel "Manual Thumb for photo" do
      ul li image_tag shoe.photo_manual_thumb.url
    end
  end

  form do |f|
    f.inputs do
      f.input :article_number
      f.input :name
    end
    f.inputs do
      f.input :year, :as => :select, :collection => 2010..2100, :include_blank => false
      f.input :season_name, :as => :select, :collection => Shoe::SEASON_NAMES, :include_blank => false
      f.input :trend
      f.input :heel, :as => :select, :collection => Shoe::HEELS, :include_blank => false
      f.input :colors, :as => :check_boxes
      f.input :sizes,  :as => :check_boxes, :label_method => :number
    end
    f.inputs do
      f.input :photo
      f.input :photo_manual_thumb
    end
    f.buttons
  end
end
