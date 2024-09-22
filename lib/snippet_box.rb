require 'sequel'

module SnippetBox

  def self.init
    Sequel.default_timezone = :utc
  end

  ####

  def self.root
    @_root ||= File.expand_path(File.dirname(__FILE__) + '/../')
  end

  def self.db
    username = 'web'
    password = 'golanger1234567'
    host = 'localhost'
    port = 5432
    db = 'snippetbox'
    @_db ||= Sequel.connect("postgres://#{username}:#{password}@#{host}:#{port}/#{db}")
    # "postgres://web:golanger1234567@localhost:5432/snippetbox"
  end

end
