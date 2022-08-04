class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def not_authenticated
    redirect_to admin_login_path, warning: "ログインしてください"
  end

  def check_admin
    redirect_to root_path, warning: (t"defaults.message.not_authenticated") unless current_user.admin?
  end
end
