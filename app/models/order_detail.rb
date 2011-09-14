class OrderDetail < ActiveRecord::Base

  belongs_to :order
  belongs_to :shoe
  belongs_to :color

  has_many :order_details_sizeses, :class_name => "OrderDetailsSizes", :dependent => :destroy
  has_many :sizes, :through => :order_details_sizeses

  validates_presence_of :color, :shoe, :quantity

  validate :shoe_comes_in_chosen_sizes
  validate :shoe_comes_in_chosen_colors

  private
  def shoe_comes_in_chosen_colors
    unless self.shoe.colors.include?(self.color)
      self.errors.add(:color,"No tenemos este articulo en el color elegido")
    end
  end

  def shoe_comes_in_chosen_sizes
    self.sizes.each do |s|
      unless self.shoe.sizes.include?(s)
        self.errors.add(:sizes, "No tenemos este articulo en el talle #{s.number}")
      end
    end
  end

end
