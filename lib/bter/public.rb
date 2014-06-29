require_relative 'request.rb'

module Bter
  class Public
    include Request
    
    def ticker(pair)
      query = public_request "ticker", pair
      JSON.parse query, {:symbolize_names => true}  
    end
    
    def depth(pair)
      query = public_request "depth", pair
      JSON.parse query, {:symbolize_names => true}   
    end

    def info
      query = public_request "marketinfo"
      JSON.parse query, {:symbolize_names => true}   
    end

    def details
      query = public_request "markelist"
      JSON.parse query, {:symbolize_names => true}   
    end  
    def trades(pair, tid=nil)
      tid ||= ""
      query = public_request "trade", pair + "/#{tid}"
      JSON.parse query, {:symbolize_names => true}   
    end 
  end
end
