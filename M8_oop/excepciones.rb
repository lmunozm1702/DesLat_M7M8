class Persona
    attr_accessor :nombre, :mascotas
    def initialize(nombre,mascota=nil)
        raise ArgumentError, "Argument mascota is of type #{mascota.class} but not mascota" if mascota.class != nil || mascota.class != Mascota
        @nombre=nombre
        @mascota=nil
    end
end

class Mascota
    attr_accessor :nombre
    def initialize(nombre)
        @nombre=nombre
    end
end

p1 = Persona.new("Fry","Nibler")
