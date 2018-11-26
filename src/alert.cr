module DarkSky
  struct Alert
    include JSON::Serializable
    property title : String?
    property regions : Array(String)?
    property severity : String?
    property description : String?
    property time : Int64?
    property expires : Float64
    property uri : String?
  end
end
