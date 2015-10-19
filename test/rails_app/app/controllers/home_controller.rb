class HomeController < ApplicationController
  def index
  end

  def private
  end

  def user_dashboard
  end

  def admin_dashboard
  end

  def join
  end

  def set
    session["devise.foo_bar"] = "something"
    head :ok
  end

  def unauthenticated
    r_opts = { status: :unauthorized}
    r_opts[Devise.rails5? ? :body : :text] = "unauthenticated"
    render r_opts
  end
end
