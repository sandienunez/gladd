class ApplicationController < ActionController::Base

  before_action :set_users

  private

  def set_users
      @categories = Category.all
  end


end
