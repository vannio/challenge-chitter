class Chitter < Sinatra::Base
  get "/peeps" do
    peep_list = partial(:"peep/peep", locals: { peeps: Peep.all(order: [:timestamp.desc]) })
    erb(:"peep/index", locals: { peep_formatted_list: peep_list })
  end

  get "/peeps/new" do
    @text = params[:text]
    erb(:"peep/new")
  end

  post "/peeps" do
    peep = Peep.create(
      text: params[:text],
      timestamp: Time.now,
      user: current_user
    )

    if peep.id
      peep.extract_hashtags
      redirect("/peeps")
    else
      flash.next[:error] = peep.errors.full_messages
      redirect("/peeps/new")
    end
  end
end
