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
  
  describe "POST 'create'" do
    context "valid parameters" do
      before(:each) do
        Snack.any_instance.expects(:save).returns(true)
        post :create
      end

      it { should set_the_flash.to("Your Snack has been successfully added to the list.")}
      it {should redirect_to(snacks_path)} 
      
    end
    
    context "invalid parameters" do
      before(:each) do
        Snack.any_instance.expects(:save).returns(false)
        post :create
      end
      
      it {should set_the_flash.to("Your snack could not be added. Please ensure it is not already on the list.")}
      
      it {should redirect_to(snacks_path)}
      
    end
  end
  
  describe "PUT 'update'" do
    
    it "should redirect to 'index'" do
      put :update, :id => 1
      response.should redirect_to snacks_path
    end
    
    context "valid snack id parameter" do
      before(:each) do
        Snack.expects(:update_vote_count).returns(true)
        post :update, :id => 1
      end
      
      it {should set_the_flash.to("Your Vote has been counted")}
    end
    
    context "invalid snack id parameter" do
      before(:each) do
        Snack.expects(:update_vote_count).returns(false)
        post :update, :id => 1
      end
      
      it {should set_the_flash.to("There was a problem counting your vote please try again")}
    end
  end
end
