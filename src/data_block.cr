module DarkSky
  struct DataBlock
    include JSON::Serializable
    property summary : String?
    property icon : String?
    property data : Array(DataPoint)?
  end
end
