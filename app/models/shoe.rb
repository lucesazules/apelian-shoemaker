class Shoe < ActiveRecord::Base
  validates_presence_of :article_number
  validates_presence_of :name

  has_many :colors_shoes
  has_many :colors, :through => :colors_shoes
end
