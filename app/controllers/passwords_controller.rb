class PasswordsController < ApplicationController
  before_action :require_user_logged_in   # we want only logged in users to have access to these actions. So we use a before_action and we go to application_controller to create the require_user_logged_in method, so that it is available in all controllers such as this one. Our new method should prevent execution of the bottom chunks if not a logged user

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Contraseña Actualizada"
    else
      render :edit
    end
  end

  def edit
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
