class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :authenticate_user!

  def render_create_success
    render json: @resource,
           serializer: Api::V1::Auth::Sessions::UserSerializer,
           status: :ok
  end

  def render_destroy_success
    head :no_content
  end
end