class ImgurController < ApplicationController
  require 'net/http'
  require 'net/https'

  def deck
    headers = { "Authorization" => ENV["imgur_id"]}
    path = "/3/album/kTz8F"
    uri = URI("https://api.imgur.com" + path)
    request, data = Net::HTTP::Get.new(path, headers)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(request)
    JSON.parse(response.body)
  end
end
