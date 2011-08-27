class Size < ActiveRecord::Base

  has_many :shoes_sizes
  has_many :shoes, :through => :shoes_sizes

  validates_presence_of :number

end
