require 'spec_helper'

describe Color do

  before do
    Factory(:color)
  end

  it "should have a name" do
    should validate_presence_of :name
  end

  it "should have many shoes" do
    should have_many(:shoes).through(:colors_shoes)
  end

end