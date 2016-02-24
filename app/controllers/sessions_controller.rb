# Controller for logging users in and out using sessions
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)

    respond_to do |format|
      if user && user.authenticate(session_params[:password])
      else
        format.html { render :new, danger: 'Invalid email/password combination' }
      end
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
