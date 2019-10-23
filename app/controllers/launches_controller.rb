class LaunchesController < ApplicationController
  def index
    @launches = JSON.parse(LaunchRequest.get_launch_data)
    puts @launches
  end
end
