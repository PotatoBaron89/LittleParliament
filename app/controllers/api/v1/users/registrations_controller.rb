class Api::V1::Users::RegistrationsController < ApplicationController
  def create
    user = User.create!(
      validate_params
    )

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end

  private

  def validate_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end