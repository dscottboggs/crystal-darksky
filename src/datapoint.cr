module DarkSky
  struct DataPoint
    include JSON::Serializable
    @[JSON::Field(converter: Time::EpochConverter)]
    getter time : Time?
    getter summary : String?
    getter icon : String?
    @[JSON::Field(key: "sunriseTime")]
    getter sunrise_time : Int64?
    @[JSON::Field(key: "sunsetTime")]
    getter sunset_time : Int64?
    @[JSON::Field(key: "precipIntensity")]
    getter precip_intensity : Float64?
    @[JSON::Field(key: "precipIntensityMax")]
    getter precip_intensity_max : Float64?
    @[JSON::Field(key: "precipIntensityMaxTime")]
    getter precip_intensity_max_time : Int64?
    @[JSON::Field(key: "precipProbability")]
    getter precip_probability : Float64?
    @[JSON::Field(key: "precipType")]
    getter precip_type : String?
    @[JSON::Field(key: "precipAccumulation")]
    getter precip_accumulation : Float64?
    getter temperature : Float64?
    @[JSON::Field(key: "temperatureMin")]
    getter temperature_min : Float64?
    @[JSON::Field(key: "temperatureMinTime")]
    getter temperature_min_time : Int64?
    @[JSON::Field(key: "temperatureMax")]
    getter temperature_max : Float64?
    @[JSON::Field(key: "temperatureMaxTime")]
    getter temperature_max_time : Int64?
    @[JSON::Field(key: "apparentTemperature")]
    getter apparent_temperature : Float64?
    @[JSON::Field(key: "apparentTemperatureMin")]
    getter apparent_temperature_min : Float64?
    @[JSON::Field(key: "apparentTemperatureMinTime")]
    getter apparent_temperature_min_time : Int64?
    @[JSON::Field(key: "apparentTemperatureMax")]
    getter apparent_temperature_max : Float64?
    @[JSON::Field(key: "apparentTemperatureMaxTime")]
    getter apparent_temperature_max_time : Int64?
    @[JSON::Field(key: "nearestStormBearing")]
    getter nearest_storm_bearing : Float64?
    @[JSON::Field(key: "nearestStormDistance")]
    getter nearest_storm_distance : Float64?
    @[JSON::Field(key: "dewPoint")]
    getter dew_point : Float64?
    @[JSON::Field(key: "windSpeed")]
    getter wind_speed : Float64?
    @[JSON::Field(key: "windBearing")]
    getter wind_bearing : Float64?
    @[JSON::Field(key: "cloudCover")]
    getter cloud_cover : Float64?
    getter humidity : Float64?
    getter pressure : Float64?
    getter visibility : Float64?
    getter ozone : Float64?
    getter moon_phase : Float64?
  end
end
