require 'spec_helper'

describe Admin::CurrentCampaignController do

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "should be successful" do
      put 'update'
      response.should be_redirect
    end
  end

end
