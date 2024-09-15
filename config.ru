require './lib/snippet_box.rb'

Dir.glob('./db/{models}/*.rb').each { |f| require f }
Dir.glob('./lib/{controllers}/*.rb').each { |f| require f }

run MainController

=begin
rackup -p 4001
=end
