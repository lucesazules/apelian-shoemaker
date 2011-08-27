require 'spec_helper'

describe Shoe do

  it "should have an article_number" do
    should validate_presence_of :article_number
  end

  it "should have a name" do
    should validate_presence_of :name
  end

  it "should belong to a season"
  it "should have a photo"

  it "is available in many colors" do
    should have_many(:colors).through(:colors_shoes)
  end

  it "is available in many seizes"

end