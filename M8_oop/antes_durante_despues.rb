class Durante
    def metodo_complejo
        puts "durante"
    end
end

class AntesDespues < Durante
    def metodo_complejo
        puts "antes"
        super
        puts "despues"
    end
end

AntesDespues.new.metodo_complejo
