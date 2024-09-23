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

  configure :development, :production do
    #logger = Logger.new(File.open("#{root}/log/#{environment}.log", 'a'))
    logger = Logger.new $stdout
    logger.level = Logger::DEBUG if development?
    set :logger, logger
  end

  before do
    @year = Time.now.getutc.year
  end

end
