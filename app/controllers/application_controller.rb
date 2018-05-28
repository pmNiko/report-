class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, :except => [:update, :create]
  before_action :authenticate_user!
end
