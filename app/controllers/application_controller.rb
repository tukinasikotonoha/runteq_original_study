class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  # ログイン済みユーザーかどうか確認
  before_action :require_login

  private

  def not_authenticated
    flash[:danger] = 'ログインしてください'
    redirect_to login_path
  end
end
