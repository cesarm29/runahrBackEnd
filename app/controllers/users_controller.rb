class UsersController < ApplicationController
#validation before the action
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_request!, :except => [:index, :login, :create ]

# show users
  def index 
    @user = User.all 
    if @user.present?
      render json: @user
    else
      render json: {status: 'Error in load'}, status: :not_found
    end 
  end
# show users for role
  def get
    @user = User.where("role=?", params[:id])
    if @user.present?
      render json: @user
    else
      render json: {status: 'Error in load'}, status: :not_found
    end
  end
# show user for id
  def show
    user = User.find(params[:id])
    if user.present?
      render json: {status: 'SUCCESS', message:'Loaded User', data:user},status: :ok
    else
      render json: {status: 'Error in load'}, status: :not_found
    end
  end
# create user
  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 'User created successfully'}, status: :created
    else
      render json: { status: 'Error created user' }, status: :bad_request
    end
  end
# update user
  def update
    user = User.find_by(params[:id])
    if user.update_attributes(user_params)
      render json: {status: 'SUCCESS', message:'Updated user', data:user},status: :ok
    else
      render json: {status: 'ERROR', message:'Error user not updated', data:user.errors},status: :unprocessable_entity
    end
  end 
# destroy user
  def destroy
    user = User.find(params[:id])
    if user.present?
      user.destroy
      render json: {status: 'SUCCESS', message:'Deleted user', data:user},status: :ok
    else
      render json: {status: 'Error deleted user'}, status: :not_found
    end
  end
# confirm user
  def confirm
    token = params[:token].to_s
    user = User.find_by(confirmation_token: token)
    if user.present?
      user.mark_as_confirmed!
      render json: {status: 'User confirmed successfully'}, status: :ok
    else
      render json: {status: 'Invalid token'}, status: :not_found
    end
  end
# login user
  def login
    user = User.find_by(email: params[:email].to_s.downcase)
    if user && user.authenticate(params[:password])
      if user.confirmation_token_valid?
        auth_token = JsonWebToken.encode({user_id: user.id, role: user.role, email: user.email})
        render json: {auth_token: auth_token}, status: :ok
      else
        render json: {error: 'Email not verified' }, status: :unauthorized
      end
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end
 # update email user
  def email_update
    token = params[:token].to_s
    user = User.find_by(confirmation_token: token)
    if !user || !user.confirmation_token_valid?
      render json: {error: 'The email link seems to be invalid / expired. Try requesting for a new one.'}, status: :not_found
    else
      user.update_new_email!
      render json: {status: 'Email updated successfully'}, status: :ok
    end
  end
  private
# Use callbacks to share common setup or constraints between actions.
  def set_user 
   user = User.find(params[:id]) 
  end 
# params from actions user
  def user_params
    params.require(:user).permit( :id, :name, :surname, :email, :password, :password_confirmation, :role)
  end
#end  
end
