require 'httparty'
class LaunchRequest

  def self.get_launch_data
    response = HTTParty.get('https://api.spacexdata.com/v3/launches').body
  end
end
