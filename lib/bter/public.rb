require_relative 'request.rb'

module Bter
  class Public
    include Request 

    METHODS = ['pairs', 'ticker', 'tickers', 'depth', 'marketinfo', 'markelist', 'trade'] 

    METHODS.each do |method|
      define_method(method) do |pair=nil, tid=nil|
        make_hash(public_request(method, pair, tid))
      end  
    end

    #will be removed soon
    def logging(log)
      raise "Logger is no longer available , please remove it"
    end
    
    alias_method :info, :marketinfo 
    alias_method :details, :markelist 
    alias_method :trades, :trade
    alias_method :history, :trade 

    private
    def make_hash(json_object)
      JSON.parse(json_object, {:symbolize_names => true})
    end
  end
end
