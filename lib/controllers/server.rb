require 'sinatra/base'
require 'sinatra/content_for'

class Server < Sinatra::Base

  helpers Sinatra::ContentFor

  set :views, File.join(SnippetBox.root, 'views')
  set :public_folder, File.join(SnippetBox.root, 'public')

end

