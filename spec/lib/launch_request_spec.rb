require 'rails_helper'

describe LaunchRequest do
  describe '#get_launch_data' do
    before do
      body = [{"flight_number":1,"mission_name":"FalconSat"} ,{"flight_number":2,"mission_name":"DemoSat"}].to_json
      stub_request(:get, 'https://api.spacexdata.com/v3/launches').
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
         }).
       to_return(status: 200, body: body , headers: {})
     end

     it 'makes a request to the SpaceX endpoint' do
       LaunchRequest.get_launch_data
       expect(a_request(:get, 'https://api.spacexdata.com/v3/launches')).to have_been_made
     end
   end

   describe '#get_launch' do
     before do
       body = [{"flight_number":1,"mission_name":"FalconSat"}].to_json
       stub_request(:get, 'https://api.spacexdata.com/v3/launches/1').
       with(
         headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: body , headers: {})
      end
     it 'makes a request for a specific launch' do
       LaunchRequest.get_launch(1)
       expect(a_request(:get, 'https://api.spacexdata.com/v3/launches/1')).to have_been_made
     end
   end
 end
