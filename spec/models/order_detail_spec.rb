require 'spec_helper'

describe OrderDetail do

  it { should belong_to :order }
  it { should belong_to :shoe }
  it { should have_many(:sizes).through(:order_details_sizeses) }
  it { should have_many :order_details_sizeses }

  it { should validate_presence_of :color }
  it { should validate_presence_of :quantity }

  it "should check shoe comes in chosen color" do
    @color_a = Factory(:color, :name => "a")
    @color_b = Factory(:color, :name => "b")

    @shoe = Factory(:shoe, :colors => [@color_a])

    @order_detail = Factory.build(:order_detail, :shoe => @shoe, :color => @color_b)

    @order_detail.should_not be_valid
  end

  it "should check shoe comes in chosen size" do
    @size_a = Factory(:size)
    @size_b = Factory(:size)
    @shoe = Factory(:shoe, :sizes => [@size_a])

    @order_detail = Factory.build(:order_detail, :shoe => @shoe, :sizes => @size_b)
    @order_detail.should_not be_valid
  end

end