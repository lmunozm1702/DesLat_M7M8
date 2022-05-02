#DFD del problema en https://www.figma.com/file/E7gKatpu7actSLs8BTsUrw/Piedra%2C-papel-o-tijera?node-id=0%3A1

def is_valid_param(param)
    if param == "PIEDRA" or param == "PAPEL" or param == "TIJERA"
        return true
    end
    return false
end

#Validar cantidad de parametros
if ARGV.length != 1
    puts "ERROR: Se requieren 1 parametros: piedra, papel O tijera"
    exit
end

juega_usuario=ARGV[0].upcase

if !is_valid_param(juega_usuario)
    puts "ERROR: Las olpciones a jugar son piedra, papel o tijera"
    exit
end

juega_computador = ["PIEDRA","PAPEL","TIJERA"].shuffle.first

puts("Usuario juega : #{juega_usuario.capitalize}")
puts("Computador juega : #{juega_computador.capitalize}")

if juega_usuario == juega_computador
    puts("-- Empate --")
elsif (juega_usuario == "PIEDRA" and juega_computador == "PAPEL") or
      (juega_usuario == "PAPEL" and juega_computador == "TIJERA") or
      (juega_usuario == "TIJERA" and juega_computador == "PIEDRA")
    puts("-- Gana Computador --")
else
    puts("-- Gana usuario --")
end
