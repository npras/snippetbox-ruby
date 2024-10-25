class RequestLogger

  def initialize app, logger
    @app = app
    @logger = logger
  end

  def call env
    ip, proto, method, uri = extract_from_request env

    msg = [
      "msg='received req'",
      "ip=#{ip}",
      "proto=#{proto}",
      "method=#{method}",
      "uri=#{uri}"
    ].join(' ')

    @logger.info msg

    status, headers, body = @app.call env
    [status, headers, body]
  end

  private def extract_from_request env
    request = Rack::Request.new env
    [request.ip, env["rack.url_scheme"], request.request_method, request.url]
  end

end
