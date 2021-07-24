class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        User.find_by(params[:email])&.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to [:root], notice: "User created!"
    else
      render :new
    end
  end

  #   def login
  #     #User.find_by(params[:email])&.authenticate(params[:password]
  #     if user && user.authenticate(params[:password])
  #         # Save the user id inside the browser cookie. This is how we keep the user
  #         # logged in when they navigate around our website.
  #         session[:user_id] = user.id
  #         redirect_to '/'
  #       else
  #       # If user's login doesn't work, send them back to the login form.
  #         redirect_to '/login'
  #       end
  #   end

  private

  def user_params
    params.require(:user).permit(
      :firstName,
      :lastName,
      :email,
      :password,
      :password_confirmation
    )
  end

  #   def login_params
  #     params.require(:user).permit(
  #         :email,
  #         :password
  #     )
  #   end
end
