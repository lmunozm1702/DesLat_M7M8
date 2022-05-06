def is_number(number)
    if number.match(/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+)$/) == nil
        return false
    end
    return true
end

def valida_argv(argv,largo)
    #Validar cantidad de parametros
    if largo == 0 and argv.length > 0
        return
    else
        largo =1
    end
    if argv.length != largo
        puts "ERROR: Se requiere #{largo} parametro(s)"
        exit
    end
end

def valida_argv_numeros (argv)
    argv.each { |a|
        if !is_number(a)
            puts "El parametro debe ser numérico"
            exit
        end
    }
end
