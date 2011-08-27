class Color < ActiveRecord::Base
  validates_presence_of :name

  has_many :colors_shoes
  has_many :shoes, :through => :colors_shoes
end
