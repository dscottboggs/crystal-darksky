module DarkSky
  struct Flags
    include JSON::Serializable
    @[JSON::Field(key: "darksky-unavailable")]
    getter dark_sky_unavailable : String?
    @[JSON::Field(key: "darksky-stations")]
    getter dark_sky_stations : Array(String)?
    @[JSON::Field(key: "datapoint-stations")]
    getter data_point_stations : Array(String)?
    @[JSON::Field(key: "isds-stations")]
    getter isds_stations : Array(String)?
    @[JSON::Field(key: "lamp-stations")]
    getter lamp_stations : Array(String)?
    @[JSON::Field(key: "madis-stations")]
    getter madis_stations : Array(String)?
    @[JSON::Field(key: "metars-stations")]
    getter metars_stations : Array(String)?
    @[JSON::Field(key: "metnol-license")]
    getter metnol_license : String?
    getter sources : Array(String)?
    getter units : String?
  end
end
