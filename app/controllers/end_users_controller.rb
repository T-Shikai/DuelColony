class EndUsersController < ApplicationController
  def show
  end

  def edit

  end

  def update
    if current_end_user.update(end_user_params)
      redirect_to end_users_path
    else
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:image, :name, :introduction)
  end
end
