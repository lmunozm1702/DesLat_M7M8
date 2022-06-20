class Usuario
    attr_accessor :cuentas, :nombre
    def initialize(nombre, cuentas)
        raise ArgumentError, "Argument array cuentas must have at least one CuentaBancaria class" if cuentas.length < 1
        @nombre=nombre
        @cuentas=cuentas
    end
end

class CuentaBancaria
    attr_accessor :saldo
    def initialize(nombre_banco, numero_cuenta, saldo=0)
        @nombre_banco=nombre_banco
        @numero_cuenta=numero_cuenta
        @saldo=saldo
    end

    def transferir(monto, cuenta_abono)
        if @saldo < monto
            return "-1: Saldo insufuciente en cuenta de cargo"
        end
        @saldo -= monto
        cuenta_abono.saldo += monto
        return cuenta_abono.saldo
    end
end

c1 = CuentaBancaria.new("Santander", "12345678", 5000)
c2 = CuentaBancaria.new("ITAU", "87654321", 5000)

p1=Usuario.new("Luis", [c1,c2])
#puts p1.cuentas

#puts c1.transferir(5000,c2)
#puts c1.saldo
