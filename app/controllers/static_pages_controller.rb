class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  #before_action :require_login, except: [:top]
  def top
    
  end
end
