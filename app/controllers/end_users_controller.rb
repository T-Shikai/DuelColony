class EndUsersController < ApplicationController
  def show
    @user = EndUser.find(params[:id])
    @rooms = Room.page(params[:page]).per(8).where(status: [3,5]).where('host_id = ? or guest_id = ?', current_end_user, current_end_user).order('id desc')
    @topics = @user.topics.page(params[:page]).per(4)
    @books = @user.books.page(params[:page]).per(4)
  end

  def edit

  end

  def update
    if current_end_user.update(end_user_params)
      redirect_to end_user_path(current_end_user)
    else
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:image, :name, :introduction)
  end
end
