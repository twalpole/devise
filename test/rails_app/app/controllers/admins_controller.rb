class AdminsController < ApplicationController
  if methods.include? :before_action
    before_action :authenticate_admin!
  else
    #Rails < 4.0 uses before_filter
    before_filter :authenticate_admin!
  end

  def index
  end
end
