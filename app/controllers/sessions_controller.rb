class SessionsController < ApplicationController

  def new
  end


def create
  if user = User.authenticate_with_credentials(params[:email], params[:password])
    #save user id inside browser cookie
    #this is how we keep user logged in when they navigate around our website
    session[:user_id] = user.id
    redirect_to '/'
  else
    #if users login doesn't work, send them back to login form
    ##can replace with error message if desired
    redirect_to '/login'
  end
end

  def destroy
    session[:user_id] = nil
    #could replace below with confirmation of error
    redirect_to '/login'
  end


end

# def create
#   user = User.find_by_email(params[:email])
#   #if user exists and password is correct
#   if user && user.authenticate(params[:password])
#     #save user id inside browser cookie
#     #this is how we keep user logged in when they navigate around our website
#     session[:user_id] = user.id
#     redirect_to '/'
#   else
#     #if users login doesn't work, send them back to login form
#     ##can replace with error message if desired
#     redirect_to '/login'
#   end