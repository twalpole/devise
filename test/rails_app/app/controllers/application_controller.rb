# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  if methods.include? :before_action
    before_action :current_user, unless: :devise_controller?
    before_action :authenticate_user!, if: :devise_controller?
  else
    #Rails < 4.0 uses *_filter
    before_filter :current_user, unless: :devise_controller?
    before_filter :authenticate_user!, if: :devise_controller?
  end
  respond_to *Mime::SET.map(&:to_sym)

  devise_group :commenter, contains: [:user, :admin]
end

