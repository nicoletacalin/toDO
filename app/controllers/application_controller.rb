class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  # before_action :set_time_zone, if: :user_signed_in?

  # private

  #   def set_time_zone
  #     Time.zone = current_user.time_zone
  #   end
end
