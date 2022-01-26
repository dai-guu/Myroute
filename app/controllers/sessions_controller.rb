class SessionsController < ApplicationController
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
    session[user_id] = nil
    redirect_to root_path, notice: "ログアウトに成功しました。"
  end
end
