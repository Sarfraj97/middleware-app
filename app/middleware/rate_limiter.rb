class RateLimiter
  TIME_WINDOW = 600

  def initialize(app)
    @app = app
    @requests = {}
  end

  def call(env)
    request = Rack::Request.new(env)
    client_ip = request.ip
    byebug
    @app.call(env)
  end

end