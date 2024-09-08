require './lib/snippet_box.rb'
Dir.glob('./lib/{controllers}/*.rb').each { |file| require file }

run MainController

=begin
rackup -p 4001
=end
