class Pinecone::Assistant::Chat
  require "uri"
  require "json"
  require "net/http"

  def initialize
    @assistant_name = ENV["ASSISTANT_NAME"]
    @pinecone_api_key = ENV["PINECONE_API_KEY"]
  end

  def call(prompt)
    url = URI("https://prod-1-data.ke.pinecone.io/assistant/chat/#{@assistant_name}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["Api-Key"] = @pinecone_api_key
    request.body = JSON.dump({
      "messages": [
        {
          "role": "user",
          "content": prompt
        }
      ],
      "stream": false,
      "include_highlights": true,
      "model": "gpt-4o"
    })

    response = https.request(request)
    JSON.parse response.body
  end
end