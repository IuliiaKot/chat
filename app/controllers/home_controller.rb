class HomeController < ApplicationController
  before_action :require_user
  def index
    @users = User.where.not(id: current_user)
  end
end
