class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Thank you for signing in!'
      redirect_to root_path
    else
      flash[:notice] = 'Email / Password did not match'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Goodbye'
    redirect_to root_path
  end

end
