class Chitter < Sinatra::Base
  get "/users/new" do
    erb(:"user/new")
  end

  post "/users" do
    user = User.create({
      email: params[:email],
      name: params[:name],
      username: params[:username].downcase,
      password: params[:password],
      password_confirm: params[:password_confirm]
    });

    if user.id
      session[:user_id] = user.id
      redirect("/")
    else
      flash.next[:error] = user.errors.full_messages
      redirect("/users/new")
    end
  end

  get "/users/profile/:username" do
    user = User.first(username: params[:username].downcase)
    peeps = user ? user.peeps(order: [:timestamp.desc]) : []
    peep_list = partial(:"peep/peep", locals: { peeps: peeps })
    erb(:"user/index", locals: { peep_formatted_list: peep_list, user: user })
  end
end
