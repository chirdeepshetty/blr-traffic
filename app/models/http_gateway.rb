class HttpGateway
  include HTTParty
  format :xml
  
  def self.get_request(url)
    get(url)
  end
  
end