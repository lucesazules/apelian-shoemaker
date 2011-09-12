class OrderDetail < ActiveRecord::Base

  belongs_to :order
  belongs_to :shoe
  belongs_to :size
  belongs_to :color

  validates_presence_of :order, :size, :color, :shoe, :quantity
end
