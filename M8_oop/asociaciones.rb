class Persona
    attr_accessor :nombre, :mascota
    def initialize(nombre,mascota=nil) #nil permite cardinalidad nula con mascota
        @nombre=nombre
        @mascota=mascota
    end
end

class Mascota
    attr_accessor :nombre
    def initialize(nombre)
        @nombre=nombre
    end
end

mascota1 = Mascota.new("Fido")
persona1 = Persona.new("Fernanda")
persona2 = Persona.new("Luis","loky")

puts persona1.mascota.nil?
puts persona2.mascota.nil?
