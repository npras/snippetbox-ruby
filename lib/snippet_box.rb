module SnippetBox

  def self.root
    @_root ||= File.expand_path(File.dirname(__FILE__) + '/../')
  end

  def self.db
    @_db ||= Sequel.connect('postgres://web:golanger1234567@localhost:5432/snippetbox')
  end

end
