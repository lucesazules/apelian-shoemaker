class ColorsShoe < ActiveRecord::Base
  belongs_to :color
  belongs_to :shoe

  validates_presence_of :color
  validates_presence_of :shoe

  validates_uniqueness_of :color_id, :scope => :shoe_id
end
