class PagesController < ApplicationController

  before_action :authenticate_user!, only: :dashboard


  def dashboard
  end
  
  def welcome
  end
end
