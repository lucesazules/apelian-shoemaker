require 'spec_helper'

describe Order do

  it { should have_many :order_details }

  it "should be valid when email = email_confirm" do
    a = Factory(:order, :email => "bla", :email_confirm => "bla")
    a.should be_valid
  end

  it "should not be valid when email <> email_confirm" do
    a = Factory.build(:order, :email => "bla", :email_confirm => "bla2")
    a.should_not be_valid
  end

end
