class Admin::HomesController < ApplicationController
  before_action :logged_in_user, :is_admin?
  layout "admin"

  def index
  end
end
