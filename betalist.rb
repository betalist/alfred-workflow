class BetaList
  attr_accessor :args

  def initialize(args)
    @args = URI.encode(args)
  end

  def startups
    json['startups']
  end

  protected

  def uri
    URI.parse("http://api.betalist.com/v1/startups?access_token=#{access_token}&domain=#{args}")
  end

  def response
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    request = Net::HTTP::Get.new(uri.request_uri)

    http.request(request)
  end

  def json
    JSON.parse(response.body)
  end

  def access_token
    "26068f130a0beac4bff6dfa67f9055aa"
  end
end

