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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permit_params)
      flash[:note] = "The user account updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def permit_params
    params.require(:user).permit(:username, :email, :password)
  end
end
