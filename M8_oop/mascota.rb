class Mascota
    attr_accessor :nombre
    def initialize(nombre)
        @nombre = nombre
    end

    def cruzar(otra_mascota)
        Mascota.new("Mascota nueva")
    end
end

m1 = Mascota.new("Fluffy")
m2 = Mascota.new("Laika")

hijo = m1.cruzar(m2)
puts hijo
