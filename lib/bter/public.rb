module Bter
  class Public
    
    def public_request(method, pair)
      request = Typhoeus::Request.new("https://data.bter.com/api/1/#{method}/#{pair}")
      hydra = Typhoeus::Hydra.hydra
      hydra.queue(request)       
      hydra.run
      response = request.response
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
