require 'sinatra/base'
require 'sinatra/content_for'

class Server < Sinatra::Base

  helpers Sinatra::ContentFor

  configure do
    set :views, File.join(SnippetBox.root, 'views')
    set :public_folder, File.join(SnippetBox.root, 'public')
    set :db, SnippetBox.db
  end

end
