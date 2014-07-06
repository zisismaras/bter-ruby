require_relative 'request.rb'

module Bter
  class Trade
    include Request
  
    attr_accessor :key, :secret
    
    METHODS = ['getfunds', 'orderlist', 'getorder', 'cancelorder', 'mytrades', 'placeorder'] 

    METHODS.each do |method|
      define_method(method) do |param=nil|
        if param.is_a? Hash
          trade_request(method, [param])
        elsif param.to_i > 0
          trade_request(method, [{:order_id => param}])
        else
          trade_request(method, [{:pair => param}])
        end
      end  
    end
    
    ['buy', 'sell'].each do |method|
      define_method(method) do |pair, amount, rate=nil|
        rate ||= get_rate(pair)
        trade({:pair => pair, :type => method.upcase, :rate => rate, :amount => amount})
      end
    end
   
    alias_method :get_info, :getfunds 
    alias_method :active_orders, :orderlist 
    alias_method :order_status, :getorder
    alias_method :cancel_order, :cancelorder
    alias_method :my_trades, :mytrades    
    alias_method :trade, :placeorder   

    private
    def get_rate(pair)
      Public.new.ticker(pair).values_at(:last).flatten.first
    end   
  end
end
     
