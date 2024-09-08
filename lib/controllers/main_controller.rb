require 'sinatra/base'

class MainController < Sinatra::Base

  set :public_folder, File.join(SnippetBox.root, 'static')

  get '/' do
    "Hi"
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
