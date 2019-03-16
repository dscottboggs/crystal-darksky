module DarkSky
  struct DataBlock
    include JSON::Serializable
    getter summary : String?
    getter icon : String?
    getter data : Array(DataPoint)?
  end
end
