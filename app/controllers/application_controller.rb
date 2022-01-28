class ApplicationController < ActionController::Base
  helper_method :current_user
  include SessionsHelper
  # def login?
  #   if current_user
  #     redirect_to login_path, alert: "ログインが必要です"
  #   end
  # end

  # def current_user
  #   if session[:user_id]
  #     current_user ||=User.find(session[:user_id])
  #   end
  # end



  private
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
