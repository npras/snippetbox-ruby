class RecoverException

  def initialize app, logger
    @app = app
    @logger = logger
  end

  def call env
    prior_env = env.clone
    @app.call env
  rescue => ex
    method, uri = extract_from_request prior_env
    msg = [
      "msg=#{ex.message}",
      "method=#{method}",
      "uri=#{uri}",
      "trace=#{ex.backtrace}",
    ].join(' ')

    @logger.error msg
    [500, { 'connection' => 'close' }, ['Internal Server Error. Oopsies']]
  end

  private def extract_from_request env
    request = Rack::Request.new env
    [request.request_method, request.url]
  end

end

