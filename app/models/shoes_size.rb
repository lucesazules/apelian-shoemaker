class ShoesSize < ActiveRecord::Base
  belongs_to :shoe
  belongs_to :size
  validates_presence_of :shoe
  validates_presence_of :size
  validates_uniqueness_of :size_id, :scope => :shoe_id
end
