require './lib/snippet_box.rb'
SnippetBox.init

Dir.glob('./db/{models}/*.rb').each { require _1 }
Dir.glob('./lib/{controllers}/*.rb').each { require _1 }

run MainController

=begin
rackup -p 4001
=end
