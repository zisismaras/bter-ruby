require_relative 'request.rb'

module Bter
  class Public
    include Request  
    def pairs
      query = public_request("pairs")
      JSON.parse(query, {:symbolize_names => true}) 
    end

    def ticker(pair)
      query = public_request("ticker", pair)
      JSON.parse(query, {:symbolize_names => true}) 
    end

    def tickers
      query = public_request("tickers")
      JSON.parse(query, {:symbolize_names => true}) 
    end
    
    def depth(pair)
      query = public_request("depth", pair)
      JSON.parse(query, {:symbolize_names => true})   
    end

    def info
      query = public_request("marketinfo")
      JSON.parse(query, {:symbolize_names => true})  
    end

    def details
      query = public_request("markelist")
      JSON.parse(query, {:symbolize_names => true}) 
    end  

    def trades(pair, tid='')
      query = public_request("trade", pair + "/#{tid}")
      JSON.parse(query, {:symbolize_names => true})   
    end 

    def logging(log)
      raise "Logger is no longer available , please remove it"
    end
    
    alias_method :market_info, :info  
    alias_method :marke_list, :details 
    alias_method :history, :trades 
  end
end
