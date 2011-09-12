class Order < ActiveRecord::Base

  has_many :order_details, :class_name => "OrderDetail", :dependent => :destroy
  accepts_nested_attributes_for :order_details, :reject_if => lambda { |attributes| attributes['quantity'].empty? }

  validate :email_confirmation

  private
  def email_confirmation
    unless self.email == self.email_confirm
      self.errors.add(:email_confirm, "No confirma su email")
    end
  end
end
