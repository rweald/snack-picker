require 'spec_helper'

describe Snack do
  context "validation" do
    before(:each) do
      @mySnack = Factory(:snack)
      @mySnack.save
    end
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name}
    it { should validate_presence_of :price}
    it { should validate_presence_of :category}
    it { should validate_presence_of :quantity}    
  end
end
