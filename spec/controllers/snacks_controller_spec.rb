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
      end
      
      it "should set success flash[:notice]" do
        post :create
        flash[:notice].should == "Your Snack has been successfully added to the list."
        
      end
      it "should redirect to 'index'" do
        post :create
        response.should redirect_to(:action => "index")        
      end
    end
    
    context "invalid parameters" do
    
      before(:each) do
        Snack.any_instance.expects(:save).returns(false)
      end
    
      it "should set negative flash[:notice]" do
        post :create
        flash[:notice].should == "Your snack could not be added. Please ensure it is not already on the list."
      end
      
      it "should redirect to 'index'" do
        post :create
        response.should redirect_to(:action => "index")
        
      end
      
    end
  end
  
  describe "PUT 'update'" do
    
    it "should redirect to 'index'" do
      put :update, :id => 1
      response.should redirect_to(:action => "index")
    end
    
    context "valid snack id parameter" do
      before(:each) do
        Snack.expects(:update_vote_count).returns(true)
      end

      it "should set a successful flash[:notice]" do
        put :update, :id => 1
        flash[:notice].should == "Your Vote has been counted" 
      end  
    end
    
    context "invalid snack id parameter" do
      before(:each) do
        Snack.expects(:update_vote_count).returns(false)
      end
      
      it "should set a failed flash[:notice]" do
        put :update, :id => 1
        flash[:notice].should == "There was a problem counting your vote please try again"
      end
      
    end
  end
end
