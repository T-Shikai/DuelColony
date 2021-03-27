class EndUsersController < ApplicationController
  def show
    @user = EndUser.find(params[:id])
    @rooms = Room.where(status: [3,5]).where('host_id = ? or guest_id = ?', current_end_user, current_end_user).order('id desc')
    @topics = @user.topics.order('id desc')
    @books = @user.books.order('id desc')
    @tournaments = @user.tournaments.order('id desc')
    @participants = @user.participants.order('id desc')
    

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
