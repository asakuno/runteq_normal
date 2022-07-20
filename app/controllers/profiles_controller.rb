class ProfilesController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(profile_params) 
      redirect_to profile_path, success: (t"defaults.message.update", item: User.model_name.human)
    else
      flash.now[:danger] = (t"defaults.message.not_update", item: User.model_name.human)
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :avatar_cache)
  end

end
