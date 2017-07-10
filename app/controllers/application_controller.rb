class ApplicationController < ActionController::API
include AuthenticateHelper
attr_reader :current_user

end
