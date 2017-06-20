class UsersController < ApplicationController
  def index

    @users = User.all
    render json: @users
    # render text: "Deirdre and Chris are the best!!!"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render( json: @user.errors.full_messages, status: :unprocessable_entity )
    end

  end

  def show
    @user = selected_user

    if @user
      render json: @user
    else
      render json: ["Could not find AWESOME user :("], status: 404
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def destroy
    @user = selected_user
    if @user
      @user.destroy
      render json: @user
    else
      render json: ["This user is no longer awesome."], status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def selected_user
    User.find_by(id: params[:id])
  end

end
