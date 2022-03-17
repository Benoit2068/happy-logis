class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.function == "driver"
  stored_location_for(resource) || my_deliveries_path
    elsif current_user.function == "manager"
  stored_location_for(resource) || deliveries_path
    else
  stored_location_for(resource)
    end
  end

end
