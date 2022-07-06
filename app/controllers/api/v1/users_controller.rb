class Api::V1::UsersController < ApplicationController
  def update
    user = User.find(params[:id])

    user.update!(update_params)
    head :no_content
  end

  private

  def update_params
    params.require(:user).permit(:name, :email, :password)
  end
end  