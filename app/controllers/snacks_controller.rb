class SnacksController < ApplicationController
  respond_to :html
  def new
  end

  def index
    @snacks = Snack.all()
    render :action => "index"
    @snack = Snack.new
  end
  
  def create
    new_snack = Snack.new params[:snack]
    if new_snack.save
      flash[:notice] = "Your Snack has been successfully added to the list."
    else
      flash[:notice] = "Your snack could not be added. Please ensure it is not already on the list."
    end
    
    redirect_to :action => "index"
  end

end
