class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Welcome to BetaFish"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    if @user == current_user
      @user.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :upvotes)
    end

end