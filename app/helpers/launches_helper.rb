module LaunchesHelper
  def count_succesfull_launches(launches)
    count = 0
    launches.each do |launch|
      count += 1 if launch['launch_success'] == true
    end
    count
  end

  def count_failed_launches(launches)
    count = 0
    launches.each do |launch|
      count += 1 if launch['launch_success'] == false
    end
    count
  end

end
