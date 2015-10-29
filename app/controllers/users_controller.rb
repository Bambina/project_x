class UsersController < ApplicationController
  before_action :set_user, only: %i(edit show update destroy)

  def index
    if current_user.admin
      @users = User.all
    else
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login @user
      redirect_to errands_url
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy

    redirect_to root_url
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end