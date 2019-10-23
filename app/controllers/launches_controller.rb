class LaunchesController < ApplicationController

  def index
    @launches = JSON.parse(LaunchRequest.get_launch_data)
  end

  def show
    @launch = JSON.parse(LaunchRequest.get_launch( params['id']))
  end
end
