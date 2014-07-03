Gem::Specification.new do |s|
  s.name        = 'bter-ruby'
  s.version     = '0.0.7'
  s.date        = '2014-07-03'
  s.summary     = "bter.com ruby api"
  s.description = "Ruby api for the bter.com cryptocurrency exchange"
  s.authors     = ["Zisis Maras"]
  s.email       = 'zisismaras@gmail.com'
  s.files       = ["lib/bter.rb", "lib/bter/public.rb", "lib/bter/trading.rb", "lib/bter/request.rb", "LICENSE", "README.md" , "Gemfile"]
  s.homepage    =
    'https://github.com/zisismaras/bter-ruby'
  s.license       = 'MIT'

  s.add_runtime_dependency "json", '~> 1.8', '>= 1.8.1'
  s.add_runtime_dependency "httparty", '~> 0.13', '>= 0.13.1'
  s.add_development_dependency "rspec", '~> 3.0', '>= 3.0.0'
  s.add_development_dependency "rake", '~> 10.3', '>= 10.3.2'
end
