require 'rails_helper'

describe LaunchesHelper do
  succesfull_launches = [{"flight_number":1,"mission_name":"FalconSat","launch_success":true},
    {"flight_number":2,"mission_name":"DemoSat","launch_success":true}].to_json
  failed_launches = [{"flight_number":1,"mission_name":"FalconSat","launch_success":false},
    {"flight_number":2,"mission_name":"DemoSat","launch_success":false}].to_json

    describe '#count_succesfull_launches' do
      it 'returns the number of of succesfull launches' do
        var = JSON.parse(succesfull_launches)
        expect(count_succesfull_launches(var)).to eq(2)
      end
    end

    describe '#count_failed_launches' do
      it 'returns the number of of failed launches' do
        var = JSON.parse(failed_launches)
        expect(count_failed_launches(var)).to eq(2)
      end
    end
end
