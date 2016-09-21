class API::V1::UsersController < API::BaseController

  def create
    @user = User.new(user_params)

    if @user.save
      token = AuthTokenService.encode({ user_id: @user.id })
      msg = {message: "Registration Successful", auth_token: token}
      render json: msg
    else
      msg = {message: @user.errors.full_messages}
      render json: msg
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
