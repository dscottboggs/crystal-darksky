module DarkSky
  class Forecast
    include JSON::Serializable
    property latitude : Float64
    property longitude : Float64
    property timezone : String?
    property offset : Float64?
    property currently : DataPoint?
    property minutely : DataBlock?
    property hourly : DataBlock?
    property daily : DataBlock?
    property alerts : Array(Alert)?
    property flags : Flags?
    @[JSON::Field(key: "apicalls")]
    property api_calls : Int64?
    property code : Int64?


    # these attributes are not a part of the JSON mapping

    # the time at which you wish to request a forecast.
    @[JSON::Field(ignore: true)]
    property time : Time? = nil
    @[JSON::Field(ignore: true)]
    @units = DEFAULT_UNITS
    @[JSON::Field(ignore: true)]
    @language = DEFAULT_LANUGAGE

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

    # Request the HTTP result
    def retreive
      HTTP::Client.get url do |response|
        raise ConnectionException.new(response, url) unless response.status_code === 200
        JSONResults::Forecast.from_json response.body
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
