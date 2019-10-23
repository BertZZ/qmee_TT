require 'rails_helper'

describe 'visiting the homepage' do
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

  it 'shows the names of the launches' do
    visit('/')
    expect(page).to have_content 'FalconSat'
  end
end
