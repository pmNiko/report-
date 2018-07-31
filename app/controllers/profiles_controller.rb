class ProfilesController < ApplicationController

  def edit
    @profile = current_user.profile
    @user = current_user
  end

  def update
    @profile = current_user.profile
    @profile.update!(profile_params)
    flash[:notice] = "Your profile has been update."
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name,:last_name,
      :date_of_birth, :dni, :vehicle_key)
  end

end
