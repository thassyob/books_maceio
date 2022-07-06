class ApplicationController < ActionController::API	
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_v1_user!

  private
  
  def pundit_user
    @current_api_v1_user
  end
end
