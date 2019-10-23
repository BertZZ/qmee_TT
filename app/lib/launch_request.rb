require 'httparty'
class LaunchRequest

  def self.get_past_launch_data
    response = HTTParty.get('https://api.spacexdata.com/v3/launches/past').body
  end

  def self.get_upcoming_launch_data
    response = HTTParty.get('https://api.spacexdata.com/v3/launches/upcoming').body
  end

  def self.get_launch(id)
    response = HTTParty.get("https://api.spacexdata.com/v3/launches/#{id}").body
  end

end
