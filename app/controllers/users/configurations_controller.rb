class Users::ConfigurationsController < ApplicationController
  before_action :authenticate_user!
end
