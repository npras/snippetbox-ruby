class CommonHeaders

  def initialize app
    @app = app
  end

  def call env
    status, headers, body = @app.call env
    merged_headers = list.merge headers
    [status, merged_headers, body]
  end

  private def list
    {
      'content-security-policy' => "default-src 'self';font-src fonts.gstatic.com; style-src 'self' fonts.googleapis.com",
      'referrer-policy' => 'strict-origin-when-cross-origin',
      'x-content-type-options' => 'nosniff',
      'x-frame-options' => 'DENY',
      'x-xss-protection' => '0',
      'server' => 'Ruby',
    }
  end

end
