class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def new

  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
