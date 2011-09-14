require 'spec_helper'

describe OrderDetailsSizes do
  it { should belong_to :size }
  it { should belong_to :order_detail }
  it { should validate_presence_of :size }
  it { should validate_presence_of :order_detail }
end
