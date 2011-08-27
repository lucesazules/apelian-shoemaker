require 'spec_helper'

describe Size do

  before do
    Factory(:size)
  end

  it "should have a number" do
    should validate_presence_of :number
  end

  it "should have many shoes" do
    should have_many(:shoes).through(:shoes_sizes)
  end

end