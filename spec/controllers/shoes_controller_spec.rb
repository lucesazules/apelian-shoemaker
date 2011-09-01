require 'spec_helper'

describe ShoesController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'tendencies'" do
    it "should be successful" do
      get 'tendencies'
      response.should be_success
    end
  end

end
