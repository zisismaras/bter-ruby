require 'logger'

module Bter
  module RequestLogger
    extend self
  
    def error_log(request)
      logger = Logger.new('logfile.log')
      logger.level = Logger::INFO
      
      request.on_complete do |response|
        if response.success?
          logger.info("Success")
          true
        elsif response.timed_out?
          logger.error("Got a time out")
          false
        elsif response.code == 0
          logger.error(response.return_message)
          false
        else
          logger.error("HTTP request failed: " + response.code.to_s)
          false
        end
      end
    end
    
    def info_log(code, total_time, header_hash)
      logger = Logger.new('logfile.log')
      logger.level = Logger::INFO
      logger.info("response code : #{code}")
      logger.info("Total_time: #{total_time}")
      logger.info("Header_hash: #{header_hash}")
    end
     
  end
end
