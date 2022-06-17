class CuentaBancaria
    attr_accessor :nombre_usuario

    def initialize(nombre_usuario, numero_cuenta, es_vip = 0)
        raise ArgumentError, "Length of Argument numero_cuenta is #{numero_cuenta.digits.count} and must be 8" if numero_cuenta.digits.count != 8
        @nombre_usuario=nombre_usuario
        @numero_cuenta=numero_cuenta
        @es_vip=es_vip
    end

    def numero_cuenta
        @es_vip.to_s + "-" + @numero_cuenta.to_s
    end
end

a = CuentaBancaria.new("Luis",12345678,1)
puts a.numero_cuenta

c = CuentaBancaria.new("Luis",12345678)
puts c.numero_cuenta

b = CuentaBancaria.new("Luis",2345678,1)
puts b.numero_cuenta
