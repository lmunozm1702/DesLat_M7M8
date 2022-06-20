require './carta.rb'

class Baraja
    attr_accessor :cartas

    def initialize()
        @cartas=[]

        ["C","D","E","T"].each do |pinta|
            (1..13).each do |numero|
                cartas.push Carta.new(numero,pinta)
            end
        end
    end

    def barajar
        @cartas.shuffle!
    end

    def sacar
        return @cartas.pop
    end

    def cartas_en_baraja
        return @cartas.length
    end

    def display_cartas
        @cartas.each do |x|
            print x.numero.to_s+x.pinta.to_s+' - '
        end
        puts
    end
end

rojas = Baraja.new()
rojas.display_cartas
rojas.barajar
rojas.display_cartas
puts rojas.cartas_en_baraja
a=rojas.sacar
puts a.numero.to_s+a.pinta.to_s
puts rojas.cartas_en_baraja
rojas.display_cartas

#cartas = []
#5.times do
#    cartas.push Carta.new(Random.rand(1..13),["C","D","E","T"].sample)
#end
