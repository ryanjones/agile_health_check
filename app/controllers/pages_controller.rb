class PagesController < ApplicationController
  
  def welcome
    redirect_to dashboards_path if current_user
  end
end
