class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
  end

  private

  def require_admin!
    redirect_to sales_path, alert: "You are not allowed to access this page." unless current_user.admin?
  end
end
