class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    puts params.inspect
    @id = params[:id]
    @user = User.new(email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], age: params[:age], description: params[:description], city_id: params[:city_id])
  
    if @user.save # essaie de sauvegarder en base @gossip
      redirect_to root_path, flash: { user_success: 'User was successfully created. You can now log in.' }
    else
      render :new, alert: 'User could not be created.'
    end
  end


  def show
    @user = User.find(params[:id])
  end
  
  end
