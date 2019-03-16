# TODO: Write documentation for `DarkSky`
require "json"
require "./exceptions/*"
require "./*"

module DarkSky
  VERSION          = "0.1.0"
  BASE_URL         = "https://api.darksky.net/forecast"
  DEFAULT_LANUGAGE = Languages::English
  DEFAULT_UNITS    = Units::US
  class_property api_key : String? do
    ENV["darksky_api_key"]? || File.read("API_KEY").chomp
  end
end
