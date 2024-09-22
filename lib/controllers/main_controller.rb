require './lib/controllers/server.rb'
require './db/models/snippet.rb'

class MainController < Server

  get '/' do
    snippets = snippet.latest
    erb :home, locals: { snippets: snippets }
  end

  get '/snippet/view/:id' do |id|
    item = snippet.get id
    erb :snippet_show, locals: { snippet: item }
  end

  get '/snippet/create' do
    "GET SnippetCreate"
  end

  post '/snippet/create' do
    title = 'TIMETEST GOLANG'
    content = "TIMETEST rails\nClimb Mount Fuji,\nBut slowly, slowly!\n\n– Kobayashi Issa"
    expires_at = 10
    id = snippet.insert(title:, content:, expires_at:)
    redirect to("/snippet/view/#{id}"), 303
  end

  ####

  helpers do
    def snippet
      SnippetBox::Models::Snippet.new settings.db
    end
  end

end
