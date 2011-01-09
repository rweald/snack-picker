require 'spec_helper'

describe SnacksController do
  before(:each) do
    Factory.build(:snack, :name => "oreos").save
    Factory.build(:snack, :name => "nutter butters").save
    Factory.build(:snack, :name => "ritz").save
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should assign snacks instance variable" do
      get :index
      assigns[:snacks].count().should == 3
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
      response.should render_template("new")
    end
  end
end
