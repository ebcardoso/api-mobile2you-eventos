class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:register, :authenticate, :find_18y_or_developer]
  
  def myuser
    render json: {status: 200, myuser: current_user}, status: :ok
  end

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
        render json: { status: 200, auth_token: command.result }, status: :ok
    else
        render json: { error: command.errors }, status: :unauthorized
    end
  end

  def register
    @user = User.new(user_params)
    if  @user.save
        render json: @user
    else
        render json: { errors: @user.errors }
    end
  end

  def find_18y_or_developer
    @users = User.where("age >= 18 and (profession = 'Desenvolvedor' or profession = 'Programador')")
    
    render json: {status: 200, users: @users}, status: :ok
  end

  private
    def user_params
      params.permit(:name, :age, :profession, :email, :password, :password_confirmation)
    end
end