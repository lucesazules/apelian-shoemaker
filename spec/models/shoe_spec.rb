require 'spec_helper'

describe Shoe do

  before do
    Factory(:shoe)
  end

  it "should have an article_number" do
    should validate_presence_of :article_number
  end

  it "should have a name" do
    should validate_presence_of :name
  end

  it "is available in many colors" do
    should have_many(:colors).through(:colors_shoes)
  end

  it "is available in many seizes" do
    should have_many(:sizes).through(:shoes_sizes)
  end

  it "should belong to a heel" do
    Shoe::HEELS.each do |heel|
      should allow_value(heel).for(:heel)
    end
    ["basura",nil,""].each do |invalid_heel|
      should_not allow_value(invalid_heel).for(:heel)
    end
  end

  describe "year" do
    it "should be 4 digits" do
      ["123", "12345"].each do |invalid|
        should_not allow_value(invalid).for(:year)
      end
    end
    it "should be a number" do
      should validate_numericality_of :year
    end
    it "should require year to be >= 1900 and <= 2100" do
      %W(1800 1899 0900).each do |invalid|
        should_not allow_value(invalid).for(:year)
      end
      %W(1900 1901 2099 2011 1999).each do |valid|
        should allow_value(valid).for(:year)
      end
    end
  end

  it "has a season_name" do
    Shoe::SEASON_NAMES.each do |valid|
      should allow_value(valid).for(:season_name)
    end
    [nil, "", "basura"].each do |invalid|
      should_not allow_value(invalid).for(:season_name)
    end
  end

  describe "campaign" do
    it "is composed of year and season_name" do
      shoe = Factory(:shoe, :year => "2011", :season_name => Shoe::SEASON_NAMES.first)
      shoe.campaign.should == "#{Shoe::SEASON_NAMES.first}-2011"
    end
    it "is writable" do
      shoe = Factory(:shoe)
      shoe.campaign= "verano-1910"
      shoe.campaign.should == "verano-1910"
    end
  end

  describe "campaign scope" do
    before do
      10.times{Factory(:shoe, :year => "2011", :season_name => "primavera")}
      5.times{ Factory(:shoe, :campaign => "verano-2010") }
      Factory(:shoe, :campaign => "verano-2011")
    end
    it "should scope to campaign using campaign name" do
      Shoe.by_campaign("verano-2010").count.should == 5
    end
  end

end