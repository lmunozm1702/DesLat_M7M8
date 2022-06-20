class Madre
    attr_accessor :nombre
    def initialize(nombre)
        @nombre = nombre
    end

    def despertar
        "Es hora de despertar"
    end
end

class Hija < Madre
    def despertar
        super.to_s + ' para ir al colegio'
    end
end

benja = Hija.new("Benja")
puts benja.despertar
