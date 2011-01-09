class SnacksController < ApplicationController
  respond_to :html
  def new
  end

  def index
    @snacks = Snack.all()
    render :action => "index"
  end

end
