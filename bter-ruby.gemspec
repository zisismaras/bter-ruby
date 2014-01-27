Gem::Specification.new do |s|
  s.name        = 'bter-ruby'
  s.version     = '0.0.2'
  s.date        = '2014-01-17'
  s.summary     = "bter.com ruby api"
  s.description = "Ruby api for the bter.com cryptocurrency exchange"
  s.authors     = ["Zisis Maras"]
  s.email       = 'zisismaras@gmail.com'
  s.files       = ["lib/bter.rb", "lib/bter/public.rb", "lib/bter/trading.rb", "lib/bter/request_logger.rb", "LICENSE", "README.md" , "Gemfile"]
  s.homepage    =
    'https://github.com/zisismaras/bter-ruby'
  s.license       = 'MIT'

  s.add_dependency "json"
  s.add_dependency "typhoeus"
  s.add_dependency "logger"
end
