class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(permit_params)
    if @user.save
      flash[:note] = "The user signed up successfully"
      redirect_to articles_path
    else
      render 'new'
    end 
  end

  private

  def permit_params
    params.permit(:user)
    params.require(:user).permit(:username, :email, :password)
  end
end
