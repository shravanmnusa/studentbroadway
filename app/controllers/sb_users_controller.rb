class SbUsersController < ApplicationController
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

  private

    def user_params
      params.require(:sb_user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
