class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #保存成功パターン
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the Samples App!!"
        redirect_to @user
      end
    else
      #失敗パターンはリダイレクトされます
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirm)
  end
end
