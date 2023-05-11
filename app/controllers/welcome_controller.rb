class WelcomeController < ApplicationController
  def greet
    @id = params[:id]
    redirect_to welcome_path(@id)
  end

  def show
    @id = params[:id]
    @gossips = Gossip.order(created_at: :desc)
  end

end
