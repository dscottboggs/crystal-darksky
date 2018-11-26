require "./spec_helper"

# set up mock data
module DarkSky
  @@api_key = "MOCK-API-KEY"

  class Forecast
    # make the url method public for testing purposes
    def test_url
      url
    end
  end
end

describe DarkSky::Forecast do
  describe ".from_json" do
    it "parses the example JSON." do
      test_data = File.open "spec/example-response.json" do |file|
        DarkSky::Forecast.from_json file
      end
      test_data.latitude.should eq -34.52959
      test_data.longitude.should eq -58.47028
      test_data.currently.not_nil!.time.should eq Time.unix 1543213351
      test_data.hourly.not_nil!.data.not_nil!.first.time.should eq Time.unix 1543212000
      test_data.hourly.not_nil!.data.not_nil!.first.precip_intensity.should eq 0
      test_data.alerts.should be_nil
    end
  end
  describe "#url" do
    it "renders correctly" do
      mock_time = Time.now
      DarkSky::Forecast.new(
        latitude: -34.52959,
        longitude: -58.47028
      ).test_url.should eq "https://api.darksky.net/forecast/MOCK-API-KEY/-34.52959,-58.47028?units=us&lang=en"
      DarkSky::Forecast.new(
        latitude: -34.52959,
        longitude: -58.47028,
        time: mock_time
      ).test_url.should eq "https://api.darksky.net/forecast/MOCK-API-KEY/-34.52959,-58.47028,#{mock_time.to_unix}?units=us&lang=en"
    end
  end
end
