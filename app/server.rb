class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  enable(:sessions)
  set(:session_secret, "hello_this_is_dog")

  enable(:partial_underscores)
  set(:partial_template_engine, :erb)

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def can_reply_to_peep(peep)
      current_user && current_user != peep.user
    end

    def format_date_time(string)
      Formatter.date_time(string)
    end

    def format_html(string)
      Formatter.html(string)
    end
  end
end
