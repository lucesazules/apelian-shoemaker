require 'spec_helper'

describe ColorsShoe do
  it { should validate_presence_of :color }
  it { should validate_presence_of :shoe }
  it { should validate_uniqueness_of(:color).scoped_to(:shoe)}
end