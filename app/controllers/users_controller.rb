class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
  end
end

def admin?
  self.admin
end
