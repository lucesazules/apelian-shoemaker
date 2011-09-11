require 'spec_helper'

describe OrdersController do

  describe "index" do
    before { get :index }
    it { should be_success }
  end

end
