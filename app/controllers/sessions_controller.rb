class SessionsController < ApplicationController
  
  def new
    render :new
  end

  
  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])
  
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to welcome_path(User.find_by(id: session[:user_id]).first_name),
      flash: { log_in_success: 'Log in successful' }

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end
  
end