class Padre
    attr_accessor :nombre

    def initialize(nombre)
        @nombre=nombre
    end
end

class Hija < Padre
    def initialize(nombre)
        @nombre=nombre + ' jr.'
    end
end

padre = Padre.new("Luis")
fernanda = Hija.new("Fernanda")
puts padre.nombre
puts fernanda.nombre
