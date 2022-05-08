require "uri"
require "net/http"
require 'json'
require './lib_html.rb'

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

def photos_count(response)
    return response['photos'].size
end

def build_web_page(response)
    html_head = html_header("Rover photos")

    html_body = ""

    html_body +="\n<body>"
    html_body +="\n    <div class=\"container-fluid\">"
    html_body +="\n        "
    html_body +="\n        <div class=\"jumbotron\">"
    html_body +="\n            <h1 class=\"text-center\">Rover Photos</h1>"
    html_body +="\n            <p class=\"text-center\"> " + photos_count(response).to_s + " photos - Earth date : " + response['photos'][0]['earth_date'] +"</p>"
    html_body +="\n        </div>"
    html_body +="\n        "
    html_body +="\n        <div class=\"row\">"


    #photos loop
    response['photos'].each do |photo|
        html_body +="\n            <div class=\"col-sm-6 col-md-4 col-lg-3\">"
        html_body +="\n                <figure>"
        html_body +="\n                    <img src=\""+ photo['img_src'] +"\" class=\"img-thumbnail grayscale\">"
        html_body +="\n                    <figcaption>ID: " + photo['id'].to_s + " Camera: " + photo['camera']['full_name'] +"</figcaption>"
        html_body +="\n                </figure>"
        html_body +="\n            </div>"
    end
    #end photos loop

    html_body +="\n        </div>"
    html_body +="\n    </div>"
    html_body +="\n</body>"
    html_body +="\n</html>"

    open('rover.html', "w") do |archivo|
        archivo.write html_head
        archivo.write html_body
    end

end

### Main()
response = get_rover_api_data()
build_web_page(response)
