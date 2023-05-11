class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    puts params.inspect
    @id = params[:id]
    @user = User.new(email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], age: params[:age], description: params[:description])

    city_name = params[:city_name]
    zip_code = params[:zip_code]
    city = City.find_by(name: city_name, zip_code: zip_code)
    if city.nil?
      city = City.create(name: city_name, zip_code: zip_code)
    end
    
    @user.city = city

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
