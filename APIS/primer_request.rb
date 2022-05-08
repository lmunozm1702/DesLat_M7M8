require 'net/http'
require 'json'
require 'pp'

def request(uri)
    url = URI(uri)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    response = https.request(request)

    pp response

    # Status
    puts response.code       # => '200'
    puts response.message    # => 'OK'
    puts response.class.name # => 'HTTPOK'

    JSON.parse(response.read_body)
end

posts = request('https://jsonplaceholder.typicode.com/posts')
photos = request('https://jsonplaceholder.typicode.com/photos')

#puts posts[0]
#puts photos[0]

# puts posts[0]['userId']
# puts posts[0]['title']
