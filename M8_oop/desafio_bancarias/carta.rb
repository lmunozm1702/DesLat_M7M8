class Carta
    attr_accessor :numero, :pinta
    def initialize(numero,pinta)
        @numero=numero
        @pinta=pinta
    end

    def values
        [@pinta,@numero]
    end
end

a = Carta.new(Random.rand(1..13),["C","D","E","T"].sample)
#puts a.values


cartas = []
5.times do
    cartas.push Carta.new(Random.rand(1..13),["C","D","E","T"].sample)
end
#5.times do |n|
#    puts cartas[n].values
#end
