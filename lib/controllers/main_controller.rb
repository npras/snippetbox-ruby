require './lib/controllers/server.rb'

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
    "POST SnippetCreate"
  end

end
