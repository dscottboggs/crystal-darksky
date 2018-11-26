module DarkSky
  struct Flags
    include JSON::Serializable
    @[JSON::Field(key: "darksky-unavailable")]
    property dark_sky_unavailable : String?
    @[JSON::Field(key: "darksky-stations")]
    property dark_sky_stations : Array(String)?
    @[JSON::Field(key: "datapoint-stations")]
    property data_point_stations : Array(String)?
    @[JSON::Field(key: "isds-stations")]
    property isds_stations : Array(String)?
    @[JSON::Field(key: "lamp-stations")]
    property lamp_stations : Array(String)?
    @[JSON::Field(key: "madis-stations")]
    property madis_stations : Array(String)?
    @[JSON::Field(key: "metars-stations")]
    property metars_stations : Array(String)?
    @[JSON::Field(key: "metnol-license")]
    property metnol_license : String?
    property sources : Array(String)?
    property units : String?
  end
end
