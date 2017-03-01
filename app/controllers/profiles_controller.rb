class ProfilesController < ApplicationController
  def show
    @user = User.find_by(user_name: params[:user_name])
    @couplets = User.find_by(user_name: params[:user_name]).couplets
  end

  def edit
   @user = User.find_by(user_name: params[:user_name])
  end

  def update
    @user = User.find_by(user_name: params[:user_name])
    if @user.update_attributes(profile_params)

      redirect_to profile_path(@user.user_name)
    else
          render :edit
        end
     end

private

  def profile_params
    params.require(:user).permit(:prof, :bio)
  end
   end
