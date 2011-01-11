require 'spec_helper'

describe Snack do
  before(:each) do
    @my_snack = Factory(:snack)
    @my_snack.save
  end
  context "validation" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name}
    it { should validate_presence_of :price}
    it { should validate_presence_of :category}
    it { should validate_presence_of :quantity}    
  end
  
  describe "#update_vote_count" do
    context "valid id parameter" do
      it "should return true" do
        Snack.update_vote_count(:id => @my_snack.id).should be_true
      end
      
      it "should increase the number of votes by 1" do
        old_number = @my_snack.votes
        Snack.update_vote_count(:id => @my_snack.id)
        Snack.find(@my_snack.id).votes.should == (old_number + 1)
      end
    end
    
    context "invalid id parameter" do
      it "should return false" do
        Snack.update_vote_count(:id => nil).should_not be_true
        Snack.any_instance.expects(:save).returns(false)
        Snack.update_vote_count(:id => @my_snack.id).should_not be_true
      end        
    end
  end
end
