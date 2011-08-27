require 'spec_helper'

describe ShoesSize do
  before do
    Factory(:shoes_size)
  end
  it { should validate_presence_of :size }
  it { should validate_presence_of :shoe }
  it { should validate_uniqueness_of(:size_id).scoped_to(:shoe_id)}
end