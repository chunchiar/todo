class API::V1::SessionsController < API::BaseController

  def create
    # binding.pry

    @user = User.find_by(password: params["user"]["password"] ,email: params["user"]["email"])

    if @user
      token = AuthTokenService.encode({ user_id: @user.id })
      msg = {message: "Login Successful", auth_token: token}
      render json: msg
    else
      msg = {message: "Login Fail"}
      render json: msg
    end

  end

end
