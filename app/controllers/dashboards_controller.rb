class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @waffles = "waffles"
  end
end
