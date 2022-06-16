class Persona
    attr_accessor :nombre, :mascotas

    def initialize(nombre, mascota=nil)
        @nombre=nombre
        @mascotas = []
        @mascotas.push mascota
    end
end

class Mascota
    attr_accessor :nombre
    def initialize(nombre)
        @nombre=nombre
    end
end

m1 = Mascota.new("Seymour")
p1 = Persona.new("Fry", m1)

m2 = Mascota.new("Nibbler")
p1.mascotas.push m2

puts p1.mascotas

p2=Persona.new("Luis",[m1,m2])
puts p2.mascotas
