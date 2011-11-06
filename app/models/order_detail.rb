class OrderDetail < ActiveRecord::Base

  belongs_to :order
  belongs_to :shoe
  belongs_to :color
  belongs_to :size

  validates_presence_of :color, :shoe, :quantity, :size

  validate :shoe_comes_in_chosen_size
  validate :shoe_comes_in_chosen_colors

  private
  def shoe_comes_in_chosen_colors
    unless self.shoe.colors.include?(self.color)
      self.errors.add(:color,"No tenemos este articulo en el color elegido")
    end
  end

  def shoe_comes_in_chosen_size
    unless self.shoe.sizes.include?(self.size)
      self.errors.add(:sizes, "No tenemos este articulo en el talle #{s.number}")
    end
  end

end
