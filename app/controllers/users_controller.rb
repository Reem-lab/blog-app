class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
