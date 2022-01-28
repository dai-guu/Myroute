class UsersController < ApplicationController

  before_action :logged_in_user, only:[:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path, notice: "新規登録に成功しました。"
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :profile_image)
  end
end
