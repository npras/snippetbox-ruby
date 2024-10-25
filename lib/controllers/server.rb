require 'sinatra/base'
require 'sinatra/content_for'
require 'sinatra/custom_logger'

require 'logger'

class Server < Sinatra::Base

  helpers Sinatra::ContentFor
  helpers Sinatra::CustomLogger

  configure do
    set :views, File.join(SnippetBox.root, 'views')
    set :public_folder, File.join(SnippetBox.root, 'public')
    set :db, SnippetBox.db
  end
  
  configure :development do
    set :show_exceptions, :after_handler
  end

  configure :development, :production do
    set :logger, Logger.new(STDOUT)
  end

  before do
    @year = Time.now.getutc.year
  end

  # middlewares
  use CommonHeaders
  use RequestLogger, logger
  use RecoverException, logger

end
