class Vehiculo
    def encender
        @encendido = :on
    end

    def estado
        @encendido
    end
end

v=Vehiculo.new
puts v.estado.class
