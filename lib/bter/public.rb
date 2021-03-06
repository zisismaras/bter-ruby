require_relative 'request.rb'

module Bter
  class Public
    include Request 

    METHODS = ['pairs', 'ticker', 'tickers', 'depth', 'marketinfo', 'markelist', 'trade'] 

    METHODS.each do |method|
      define_method(method) do |pair=nil, tid=nil|
        public_request(method, pair, tid)
      end  
    end

    alias_method :info, :marketinfo 
    alias_method :details, :markelist 
    alias_method :trades, :trade
    alias_method :history, :trade 
  end
end
