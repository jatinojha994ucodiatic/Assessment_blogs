# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  include Users::Authenticable
  before_action :authenticate_admin, only: %i[ list ]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def list
    @user = User.all
    respond_to do |format|
      format.html {
        flash[:notice] = "Users list was successfully fetched"
        render :list
      }
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  protected

  # Creating separate after_sign_up_paths for patient_user and staff_user

  # def after_sign_up_path_for(patient_user)
  #   flash[:notice] = 'Welcome! You have signed up successfully.'
  #   privacy_agreement_path
  # end

  # # Add an after_sign_up path for staff_user
  # def after_sign_up_path_for(staff_user)
  #   flash[:notice] = 'Welcome! You have signed up successfully.'
  #   dashboard_path
  # end
end
