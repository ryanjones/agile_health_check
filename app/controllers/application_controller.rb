class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :better_errors_hack, if: -> { Rails.env.development? }

  def after_sign_in_path_for(resource)
    dashboard_path || root_path
  end

  def better_errors_hack
    request.env['puma.config'].options.user_options.delete :app
  end
end
