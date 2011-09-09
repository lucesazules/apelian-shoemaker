require 'spec_helper'

describe ShoesController do
  render_views(true)

  describe "GET 'index'" do
    before do
      get :index
    end
    it "should be successful" do
      response.should be_success
    end
    it { should assign_to(:shoes) }
    it { should assign_to(:search) }
    pending "should not select any button from main menu" do
      response.should_not have_tag('nav#main_menu') do
        with_tag('li.selected')
      end
    end
  end

  describe "GET 'show'" do
    pending "should be successful" do
      response.should be_success
    end
  end

  describe "GET 'trend'" do
    before do
      get :trend
    end
    it "should be successful" do
      response.should be_success
    end
    it { should assign_to(:shoes) }
  end

end
