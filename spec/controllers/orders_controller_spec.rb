require 'spec_helper'

describe OrdersController do

  describe "new" do
    before { get :new }
    it { should respond_with :success }
    it { should assign_to(:order)}
  end

  describe "create" do
    before do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
    end
    describe "if order is valid" do
      before do
        post :create, :order => Factory.attributes_for(:order, :order_details_attributes => {
            :'1' => {
                :size_id => Factory(:size).id,
                :color_id => Factory(:color).id,
                :shoe_id => Factory(:shoe).id,
                :quantity => 1
            }
        })
      end
      it { should redirect_to assigns(:order) }
      it "send email" do
        ActionMailer::Base.deliveries.size.should==1
      end
      it "should create order_details" do
        expect{post( :create, :order => Factory.attributes_for(:order, :order_details_attributes => {
            :'1' => {
                :size_id => Factory(:size).id,
                :color_id => Factory(:color).id,
                :shoe_id => Factory(:shoe).id,
                :quantity => 1
            }
        }))}.to change{OrderDetail.count}.by 1
      end
    end
  end

end