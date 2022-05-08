require "uri"
require "net/http"
require 'json'

#valida respuesta del API, si es <> 200OK, muestra pantalla de error
def display_error_message(type, code, message)
end

def api_response_validation(code, message)
    if code != "200"
        display_error_message("API", code, message)
        exit
    end
    return true
end

def get_rover_api_data()
    url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    response = https.request(request)

    api_response_validation(response.code, response.message)

    return JSON.parse(response.read_body)
end

### Main()

response = get_rover_api_data()
puts response
