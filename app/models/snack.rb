class Snack < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :price
  validates_presence_of :category
  validates_presence_of :quantity
  
  def self.update_vote_count(args)
    begin
      curr_snack = Snack.find(args[:id])
      curr_snack.votes += 1
      return curr_snack.save
    rescue Exception => e
      return false
    end
    
    false
  end
end
