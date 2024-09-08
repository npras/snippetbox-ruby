module SnippetBox

  def self.root
    @_root ||= File.expand_path(File.dirname(__FILE__) + '/../')
  end

end
