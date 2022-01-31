class SessionsController < ApplicationController
  # before_action :user_state, only: [:create]


  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログインに成功しました。"
    else
      flash.now[:alert] = "Eメールもしくはパスワードが違います。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトに成功しました。"
  end

  # protected

  # def user_state
  #   user = User.find_by(email: params[:user][:email])
  #   if @user
  #     if @user.valid_password?(params[:user][:password]) && !@user.is_deleted
  #       redirect_to new_user_session_path
  #     end
  #   end
  # end
end
