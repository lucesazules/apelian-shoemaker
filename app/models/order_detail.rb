class OrderDetail < ActiveRecord::Base

  belongs_to :order
  belongs_to :shoe
  belongs_to :color

  has_many :order_details_sizeses, :class_name => "OrderDetailsSizes"
  has_many :sizes, :through => :order_details_sizeses

  validates_presence_of :color, :shoe, :quantity
end
