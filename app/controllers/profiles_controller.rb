class ProfilesController < ApplicationController
   before_action :owned_profile, only: [:edit, :update]
   before_action :authenticate_user!
  def show
    @user = User.find_by(user_name: params[:user_name])
    @couplets = User.find_by(user_name: params[:user_name]).couplets.order(created_at: :DESC)
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
def owned_profile
    @user = User.find_by(user_name: params[:user_name])
    unless current_user == @user
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end
  def profile_params
    params.require(:user).permit(:prof, :bio)
  end
   end
