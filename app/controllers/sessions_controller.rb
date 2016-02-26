# Controller for logging users in and out using sessions
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      log_in user
      remember_if_checked user
      redirect_to user, notice: 'Welcome back!'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def session_params
    permitted = params.require(:session).permit(:email, :password, :remember_me)
    permitted[:email].downcase
    permitted
  end

  def remember_if_checked(user)
    session_params[:remember_me] == '1' ? remember(user) : forget(user)
  end
end
