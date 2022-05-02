#Validar cantidad de parametros
if ARGV.length != 1
    puts "ERROR: Se requiere 1 parametro"
    exit
end

letras = "a"
contador = 0
while letras != ARGV[0]
    letras=letras.next
    contador += 1
end

puts contador
