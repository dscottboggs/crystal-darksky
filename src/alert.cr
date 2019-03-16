require "json"
module DarkSky
  struct Alert
    include JSON::Serializable
    getter title : String?
    getter regions : Array(String)?
    getter severity : String?
    getter description : String?
    getter time : Int64?
    getter expires : Float64
    getter uri : String?
  end
end
