class UsersController < ApplicationController 

  skip_before_filter :authenticate, :only => :create

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    #permitted_params
    @user = User.new(permitted_params_create)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def permitted_params_create
    params.require(:user).permit([:username, :password])
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(permitted_params_update)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def permitted_params_update
    params.require(:user).permit([:password])
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
end
