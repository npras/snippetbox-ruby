require './lib/controllers/server.rb'
require './db/models/snippet.rb'

class MainController < Server

  get '/' do
    erb :home
  end

  get '/snippet/view/:id' do |id|
    "GET SnippetView #{id}"
  end

  get '/snippet/create' do
    "GET SnippetCreate"
  end

  post '/snippet/create' do
    title = 'O rails'
    content = "O rails\nClimb Mount Fuji,\nBut slowly, slowly!\n\n– Kobayashi Issa"
    expires_at = 10
    model = SnippetBox::Models::Snippet.new(settings.db)
    id = model.insert(title, content, expires_at)
    redirect to("/snippet/view/#{id}"), 303
  end

end
