module Bter
  module Request
  	extend self
  	PUBLIC_URL = 'https://data.bter.com/api/1'
  	TRADE_URL  = 'https://bter.com/api/1/private'

    def public_request(method, pair)
      HTTParty.get("#{PUBLIC_URL}/#{method}/#{pair}").body
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
      HTTParty.post("#{TRADE_URL}/#{method}",
                    :body => @params,
                    :headers => {'Content-Type' => 'application/x-www-form-urlencoded',
                    	         'KEY' => @key, 
                    	         'Sign' => sign.to_s
                    	        }
                   ).body
    end 

    def sign
      hmac = OpenSSL::HMAC.new(@secret,OpenSSL::Digest::SHA512.new)
      @params = @params.collect {|k,v| "#{k}=#{v}"}.join('&')
      hmac.update @params      
    end
  end
end