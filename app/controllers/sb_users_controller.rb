class SbUsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @sb_users = SbUser.paginate(page: params[:page])
  end

  def show
    @user = SbUser.find(params[:id])
  end

  def new
	@user = SbUser.new
  end
  def create
    @user = SbUser.new(user_params)
    if @user.save
	  flash[:success] = "Welcome to the StudentBroadway!"
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
    @user = SbUser.find(params[:id])
  end
  def update
    @user = SbUser.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    SbUser.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to sb_users_url
  end

  private

    def user_params
      params.require(:sb_user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
	# Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
		store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
	# Confirms the correct user.
    def correct_user
      @user = SbUser.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
	# Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
