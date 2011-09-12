require 'spec_helper'

describe OrderDetail do

  it { should belong_to :order }
  it { should belong_to :shoe }

  it { should validate_presence_of :order }
  it { should validate_presence_of :size }
  it { should validate_presence_of :color }
  it { should validate_presence_of :quantity }

  it "should check shoe comes in chosen color" do
    @color_a = Factory(:color, :name => "a")
    @color_b = Factory(:color, :name => "b")

    @shoe = Factory(:shoe, :colors => [@color_a])
  end

  it "should check shoe comes in chosen size" do
    @order_detail = Factory.build(:order_detail, :shoe => @shoe, :color => @color_b)
    @order_detail.should_not be_valid
  end

end