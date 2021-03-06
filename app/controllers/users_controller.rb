# Controller for creating and managing Users
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_logged_in, only: [:index, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update]
  before_action :check_admin_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, flash: { success: 'User was successfully created.' } }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, flash: { success: 'User was successfully updated.' } }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, flash: { success: 'User deleted.' } }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Confirms a logged in user before accessing restricted pages
  def check_logged_in
    return if logged_in?
    store_location
    redirect_to login_path, flash: { danger: 'Please log in to access this page.' }
  end

  # Confirms the correct user before accessing restricted pages
  def check_correct_user
    redirect_to root_path unless current_user?(@user)
  end

  # Confirms that the logged in user is an admin before accessing restricted pages
  def check_admin_user
    redirect_to root_path unless current_user.admin?
    redirect_to users_path, flash: { danger: 'You cannot delete yourself.' } if current_user?(@user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
