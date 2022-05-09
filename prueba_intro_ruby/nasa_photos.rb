require "uri"
require "net/http"
require 'json'
require './lib_html.rb'

#valida respuesta del API, si es <> 200OK, muestra pantalla de error
def display_error_message(type, code, message)
    html_head = html_header("Rover photos - Error")
    html_body=""

    html_body +="\n<body>"
    html_body +="\n    <div class=\"container-fluid\">"
    html_body +="\n        "
    html_body +="\n        <div class=\"jumbotron\">"
    html_body +="\n            <h1 class=\"text-center\">Rover Photos</h1>"
    html_body +="\n            <p class=\"text-center\">Error : [" + type + "] - [" + code + "] - [" + message + "]</p>"
    html_body +="\n        </div>"
    html_body +="\n     </div>"
    html_body +="\n</body>"
    html_body +="\n</html>"

    open('rover.html', "w") do |archivo|
        archivo.write html_head
        archivo.write html_body
    end
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
    cameras={}
    #agregar la cuenta de fotos para cada camara en el key COUNT
    response['photos'].each do |photo|
        if cameras.empty?
            photo['camera']['count'] = 1
            cameras.store(photo['camera']['id'],photo['camera'])
        elsif !cameras.has_key?(photo['camera']['id'])
            photo['camera']['count'] = 1
            cameras.store(photo['camera']['id'],photo['camera'])
        else
            x=cameras[photo['camera']['id']]
            x['count'] = x['count'] + 1
            cameras.store(photo['camera']['id'],x)
        end
    end
    return cameras
end

def build_web_page(response)
    photos=photos_count(response)
    html_head = html_header("Rover photos")

    html_body = ""

    html_body +="\n<body>"
    html_body +="\n    <div class=\"container-fluid\">"
    html_body +="\n        "
    html_body +="\n        <div class=\"jumbotron\">"
    html_body +="\n            <h1 class=\"text-center\">Rover Photos</h1>"
    html_body +="\n            <p class=\"text-center\"> "

#Photo count loop for gallery header
    html_body +="\n            <ul class=\"list-group list-group-flush text-center mx-200 container\">"
    photos.each do |key,val|
        html_body += "<li class=\"list-group-item\">"
        html_body += val['full_name'].to_s
        html_body += " "
        html_body += "<span class=\"badge badge-primary badge-pill\">"
        html_body += val['count'].to_s
        html_body += "</span>"
        html_body += "</li>"
    end
    html_body +="\n            </ul>"

    html_body +="\n            </p>"
    html_body +="\n        </div>"
    html_body +="\n        "
    html_body +="\n        <div class=\"row\">"

    #photos loop
    response['photos'].each do |photo|
        html_body +="\n            <div class=\"col-sm-6 col-md-4 col-lg-3 text-center\">"
        html_body +="\n                <figure>"
        html_body +="\n                    <img src=\""+ photo['img_src'] +"\" class=\"img-thumbnail grayscale\">"
        html_body +="\n                    <figcaption class=\"figure-caption\">ID: " + photo['id'].to_s + " - " + photo['camera']['full_name'] +"</figcaption>"
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
