class ConnectionException < Exception
  def initialize(response, url)
    super "got #{response.status_code} from #{url}: #{response.body.gets}"
  end
end
