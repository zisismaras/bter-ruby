
module Bter
  class Public
  
    def public_request(method, pair)
      request = Typhoeus::Request.new("https://bter.com/api/1/#{method}/#{pair}")
      Request_logger.new.error_log(request)
      hydra = Typhoeus::Hydra.hydra
      hydra.queue(request)       
      hydra.run
      response = request.response
      Request_logger.new.info_log(response.code, response.total_time, response.headers_hash)
      response.body
    end 
    
    def ticker(pair)
      query = public_request "ticker", pair
      info = JSON.parse query, {:symbolize_names => true}  
    end
    
    def depth(pair)
      query = public_request "depth", pair
      info = JSON.parse query, {:symbolize_names => true}   
    end
    
    def trades(pair)
      query = public_request "trade", pair
      info = JSON.parse query, {:symbolize_names => true}   
    end
    
  end
end