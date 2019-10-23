require 'rails_helper'

describe LaunchRequest do
  before do
    past_body = [{"flight_number":1,"mission_name":"FalconSat"} ,{"flight_number":2,"mission_name":"DemoSat"}].to_json
    upcoming_body = [{"flight_number":75,"mission_name":"Nusantara Satu (PSN-6) / GTO-1 / Beresheet"} ,{"flight_number":76,"mission_name":"CCtCap Demo Mission 1"}].to_json
    single_body = [{"flight_number":1,"mission_name":"FalconSat"}].to_json

    stub_request(:get, 'https://api.spacexdata.com/v3/launches/past').
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Ruby'
       }).
     to_return(status: 200, body: past_body , headers: {})

     stub_request(:get, 'https://api.spacexdata.com/v3/launches/upcoming').
     with(
       headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: upcoming_body , headers: {})

     stub_request(:get, 'https://api.spacexdata.com/v3/launches/1').
     with(
       headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: single_body , headers: {})
    end

  describe '#get_past_launch_data' do
     it 'makes a request for past launch data to the SpaceX endpoint' do
       LaunchRequest.get_past_launch_data
       expect(a_request(:get, 'https://api.spacexdata.com/v3/launches/past')).to have_been_made
     end
   end

   describe '#get_upcoming_launch_data' do
      it 'makes a request for upcoming launch data to the SpaceX endpoint' do
        LaunchRequest.get_upcoming_launch_data
        expect(a_request(:get, 'https://api.spacexdata.com/v3/launches/upcoming')).to have_been_made
      end
    end

   describe '#get_launch' do
     it 'makes a request for a specific launch' do
       LaunchRequest.get_launch(1)
       expect(a_request(:get, 'https://api.spacexdata.com/v3/launches/1')).to have_been_made
     end
   end
 end
