require 'spec_helper'

describe ColorsShoe do
  before do
    Factory(:colors_shoe)
  end
  it { should validate_presence_of :color }
  it { should validate_presence_of :shoe }
  it { should validate_uniqueness_of(:color_id).scoped_to(:shoe_id)}
end