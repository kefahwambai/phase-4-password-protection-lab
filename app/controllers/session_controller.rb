class SessionsController < ApplicationController
    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        render json: @user
      else
        render json: { errors: ['Invalid email or password'] }, status: :unprocessable_entity
      end
    end
  
    def destroy
      session[:user_id] = nil
      head :no_content
    end
  end
  