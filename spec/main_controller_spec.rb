require './spec/spec_helper.rb'
require './lib/controllers/main_controller.rb'

describe MainController do

  include Rack::Test::Methods

  def app = MainController
  def store = app.settings.store


  describe "GET_player_score" do
    before do
      h = { "pepper" => 20,
            "kyle" => 27}
      app.set :store, Db::InMemoryStore.new(h)
    end

    it "gets pepper's score" do
      get '/players/pepper'
      assert_equal '20', last_response.body
      assert last_response.ok?
    end

    it "gets kyle's score" do
      get '/players/kyle'
      assert_equal '27', last_response.body
      assert last_response.ok?
    end

    it "return's 404 for notfound player" do
      get '/players/notfound'
      assert_equal 404, last_response.status
    end
  end


  describe "POST_record_win" do
    it "calls record_win each time" do
      app.set :store, Db::StubMemoryStore.new
      name = 'pepperx'
      assert_nil store.get_player_score(name)
      assert_equal 0, store.win_calls.size
      7.times { post "/players/#{name}#{_1+1}" }
      assert_equal 7, store.win_calls.size
      assert_equal name+'1', store.win_calls.first
      assert_equal name+'7', store.win_calls.last
    end
  end

  describe "DELETE_player" do
    it "deletes a player by name" do
      h = { "pepper" => 20,
            "kyle" => 27}
      store = Db::InMemoryStore.new(h)
      app.set :store, store
      assert_equal 20, store.get_player_score('pepper')
      delete '/players/pepper'
      assert last_response.ok?
      assert_nil store.get_player_score('pepper')
      assert_equal 27, store.get_player_score('kyle')
    end
  end


  describe "GET_league" do
    it "returns league table as JSON" do
      h = {'Tiest' => 14,
           'Chris' => 20,
           'Cleo' => 32}
      app.set :store, Db::InMemoryStore.new(h)
      get '/league'
      assert last_response.ok?
      assert_equal 'application/json', last_response.content_type
      got = JSON.parse last_response.body
      want = [['Cleo', 32],
              ['Chris', 20],
              ['Tiest', 14]]
      assert_equal want, got
    end
  end

end
