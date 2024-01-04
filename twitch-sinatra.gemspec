Gem::Specification.new do |s|
  s.name          = 'twitch-sinatra'
  s.version       = '0.0.1'
  s.authors       = ['Keith Thornhill']
  s.email         = 'kthornhill@twitch.tv'
  s.homepage      = 'https://git-aws.internal.justin.tv/common/twitch-sinatra'
  s.summary       = 'Base Sinatra app for Ruby API services'
  s.description   = 'Base Sinatra app for Ruby API services'

  s.files         = Dir['lib/**/*']
  s.platform      = Gem::Platform::RUBY

  s.add_dependency 'sinatra'
  s.add_dependency 'sinatra-contrib'
  s.add_dependency 'chitin'
  s.add_dependency 'statsd-ruby'
  s.add_dependency 'rollbar'
end