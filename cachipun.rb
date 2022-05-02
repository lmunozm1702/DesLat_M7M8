def is_number(number)
    if number.match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
        return false
    end
    return true
end

def valida_menu(opcion)
    if !is_number(opcion)
        puts "Opción inválida, intente nuevamente"
        return false
    end
    if opcion.to_i >= 0 and opcion.to_i <=4
        return true
    else
        puts "Opción inválida, intente nuevamente"
        return false
    end
end

#imprime menu e ingresa selección
def menu (jugador)
    puts "Opciones disponibles #{jugador}:"
    puts "[1] Piedra"
    puts "[2] Papel"
    puts "[3] Tijeras"
    puts "[4] Salir"
    puts "Ingrese opción: "
    opcion = gets.chomp.upcase
    return opcion
end

def ganador(jgdr1, jgdr2)
    if jgdr1 == jgdr2
        return 0
    elsif (jgdr1 == "PIEDRA" and jgdr2 == "PAPEL") or
        (jgdr1 == "PAPEL" and jgdr2 == "TIJERA") or
        (jgdr1 == "TIJERA" and jgdr2 == "PIEDRA")
        return 1
    else
        return 2
    end
end


###Main()
system("clear")
validar_op1 = false
until validar_op1
    op_jugador1 = menu ("Jugador 1")
    validar_op1 = valida_menu (op_jugador1)
end

if op_jugador1 == "4"
    puts "Salida seleccionada."
    exit
end

system("clear")
validar_op2 = false
until validar_op2
    op_jugador2 = menu ("Jugador 2")
    validar_op2 = valida_menu (op_jugador2)
end

if op_jugador2 == "4"
    puts "Salida seleccionada."
    exit
end

ganador = ganador(op_jugador1, op_jugador2)
if ganador == 0
    puts "***** Empate *****"
else
    puts "***** Gana Jugador #{ganador}"
end
