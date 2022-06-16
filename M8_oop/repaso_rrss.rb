class Persona
    attr_accessor :nombre, :edad, :rrss

    def initialize (nombre, edad, rrss)
        @nombre = nombre
        @edad = edad
        @rrss = rrss
    end
end

class RedScocial
    attr_accessor :tipo, :usuario

    def initialize (tipo, usuario)
        @tipo = tipo
        @usuario = usuario
    end
end

rs1 = RedScocial.new(:facebook,'lop2034')
rs2 = RedScocial.new(:teitter,'@lop2034')
fernando = Persona.new('Fernando',29,[rs1,rs2])
puts fernando.rrss
