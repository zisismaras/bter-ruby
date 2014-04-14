module Bter
  class Public
  
    def initialize
      @logging = false
    end
    
    def logging(p)
      if p == :on
        @logging = true
      end
    end
  
    def public_request(method, pair)
      request = Typhoeus::Request.new("https://data.bter.com/api/1/#{method}/#{pair}")
      if @logging
        RequestLogger.error_log(request)
      end
      hydra = Typhoeus::Hydra.hydra
      hydra.queue(request)       
      hydra.run
      response = request.response
      if @logging
        RequestLogger.info_log(response.code, response.total_time, response.headers_hash)
      end
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
