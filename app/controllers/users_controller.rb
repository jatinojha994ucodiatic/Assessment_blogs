class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  def index
    @users = User.all
  end

  def impersonate
    user = User.find(params[:id])
    impersonate_user(user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end


  private
  def require_admin
    redirect_to root_path, notice: "You're not authentic to access this feature" unless true_user.has_role?( :admin)
  end
end
