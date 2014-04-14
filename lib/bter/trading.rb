
module Bter
  class Trade
  
    attr_accessor :key, :secret
    
    def initialize
      @logging = false
    end
    
    def logging(p)
      if p == :on
        @logging = true
      end
    end
        
    def trade_request(method, params=nil)
      if params.nil?
        @params = {:method => method}
      else
        @params = {:method => method}
        params.each do |param|
          @params.merge!(param)
        end
      end
      request = Typhoeus::Request.new(
        "https://bter.com/api/1/private/#{method}",
        method: :post,
        body: @params,
        headers: { Key: @key, Sign: sign }
        )
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
    
    def sign
      hmac = OpenSSL::HMAC.new(@secret,OpenSSL::Digest::SHA512.new)
      @params = @params.collect {|k,v| "#{k}=#{v}"}.join('&')
      signed = hmac.update @params      
    end
       
    def get_info    
      query = trade_request "getfunds"
      info = JSON.parse query, {:symbolize_names => true}    
    end
    
    def active_orders
      query = trade_request "orderlist"
      info = JSON.parse query, {:symbolize_names => true}
    end 
    
    def trade(*params)
      query = trade_request "placeorder", params
      info = JSON.parse query, {:symbolize_names => true}
    end
    
    #abstract the trade to buy and sell
    def buy(pair, amount, rate=nil)
      rate ||= get_rate(pair)
      trade({:pair => pair, :type => "BUY", :rate => rate, :amount => amount})
    end
    
    def sell(pair, amount, rate=nil)
      rate ||= get_rate(pair)
      trade({:pair => pair, :type => "SELL", :rate => rate, :amount => amount})
    end
    
    def order_status(order_id)
      query = trade_request "getorder", [{:id => order_id}]
      info = JSON.parse query, {:symbolize_names => true}
    end
    
    def cancel_order(order_id)
      query = trade_request "cancelorder", [{:id => order_id}]
      info = JSON.parse query, {:symbolize_names => true}
    end
    
    def get_rate(pair)
      Public.new.ticker(pair).values_at(:last).flatten
    end
    
  end
end
     
