module SnippetBox

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
  end

end
