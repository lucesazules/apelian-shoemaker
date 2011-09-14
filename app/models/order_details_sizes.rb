# habtm relationship OrderDetail - Size
class OrderDetailsSizes < ActiveRecord::Base
  belongs_to :order_detail
  belongs_to :size
  validates_presence_of :order_detail
  validates_presence_of :size
end
