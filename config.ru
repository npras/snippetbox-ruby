require './lib/snippet_box.rb'
SnippetBox.init

[
  './db/models/*.rb',
  './lib/{middlewares,controllers}/*.rb',
].each { |g| Dir.glob(g).each { require _1 } }

run MainController
