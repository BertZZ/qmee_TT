class LaunchesController < ApplicationController

  def index
    @past_launches = JSON.parse(LaunchRequest.get_past_launch_data)
    @upcoming_launches = JSON.parse(LaunchRequest.get_upcoming_launch_data)
  end

  def show
    @launch = JSON.parse(LaunchRequest.get_launch( params['id']))
  end
end
