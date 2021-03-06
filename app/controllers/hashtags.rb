class Chitter < Sinatra::Base
  get "/hashtag/:name" do
    hashtag = Hashtag.first(name: params[:name].downcase)
    peeps = hashtag ? hashtag.peeps(order: [:timestamp.desc]) : []
    peep_list = partial(:"peep/peep", locals: { peeps: peeps })
    erb(:"hashtag/index", locals: { peep_formatted_list: peep_list })
  end
end
