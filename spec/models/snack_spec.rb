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
        Snack.update_vote_count(@my_snack.id).should be_true
      end
    end
  end
end
