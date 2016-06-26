class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  enable(:sessions)
  set(:session_secret, "hello_this_is_dog")

  enable(:partial_underscores)
  set(:partial_template_engine, :erb)

  helpers Helpers
end
