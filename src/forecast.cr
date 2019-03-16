require "http"

module DarkSky
  class Forecast
    include JSON::Serializable
    getter latitude : Float64
    getter longitude : Float64
    getter timezone : String?
    getter offset : Float64?
    getter currently : DataPoint?
    getter minutely : DataBlock?
    getter hourly : DataBlock?
    getter daily : DataBlock?
    getter alerts : Array(Alert)?
    getter flags : Flags?
    @[JSON::Field(key: "apicalls")]
    getter api_calls : Int64?
    getter code : Int64?


    # these attributes are not a part of the JSON mapping

    # the time at which you wish to request a forecast.
    @[JSON::Field(ignore: true)]
    property time : Time? = nil
    @[JSON::Field(ignore: true)]
    property units = DEFAULT_UNITS
    @[JSON::Field(ignore: true)]
    property language = DEFAULT_LANUGAGE

    def initialize(@latitude,
                   @longitude,
                   @time = nil,
                   @units = DEFAULT_UNITS,
                   @language = DEFAULT_LANUGAGE)
    end

    # set the @time attribute, and request a new batch of results with the new
    # time set. This will return a JSONResults::Forecast for the given time.
    def at(@time)
      retreive
    end

    def self.now(latitude, longitude, units = DEFAULT_UNITS, language = DEFAULT_LANUGAGE)
      new(latitude, longitude, units: units, language: language).retreive
    end

    # Request the HTTP result, returning an instance of Forecast with the values
    # all filled in from the server
    def retreive
      HTTP::Client.get url do |response|
        raise ConnectionException.new(response, url) unless response.status_code === 200
        # OPTIMIZE: this instantiates a new Forecast unnecessarily, discarding
        # the one it is a mmeber of.
        self.class.from_json(response.body_io).tap do |o|
          o.time = @time
          o.units = @units
          o.language = @language
        end
      rescue e : JSON::ParseException
        pp! url
        pp! response.try &.body_io.gets_to_end || "nil!"
        raise e
      end
    end

    private def coordinates
      String.build { |b| b << @latitude; b << ","; b << @longitude }
    end

    private def url
      String.build do |builder|
        builder << BASE_URL
        builder << "/"
        builder << DarkSky.api_key
        builder << "/"
        builder << coordinates
        if t = @time
          builder << "," << t.to_unix
        end
        builder << "?units="
        builder << @units
        builder << "&lang="
        builder << @language
      end
    end
  end
end
