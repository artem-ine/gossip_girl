class WelcomeController < ApplicationController
  def greet
    first_name = params[:name]
    redirect_to welcome_first_name_path(first_name: first_name)
  end

  def first_name
    @first_name = params[:first_name]
    @gossips = Gossip.all
  end

end
