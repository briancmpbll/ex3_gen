# Controller for logging users in and out using sessions
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      log_in user
      remember user
      redirect_to user, notice: 'Welcome back!'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_params
    permitted = params.require(:session).permit(:email, :password)
    permitted[:email].downcase
    permitted
  end
end
