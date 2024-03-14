module Users
  module Authenticable
    extend ActiveSupport::Concern

    def authenticate_admin
      return true if current_user.has_role?(:admin)
      redirect_to root_path, notice: "You are not allowed to acces this page #{current_user.email} is not admin: #{current_user.has_role?(:admin)}"
    end
  end
end