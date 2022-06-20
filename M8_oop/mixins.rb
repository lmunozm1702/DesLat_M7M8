module Nadador
    def nadar
        puts "Puedo nadar!"
    end
end

module Carnivoro
    def comer
        puts "Puedo comer carne!"
    end
end

class Mamifero
end

class Gato < Mamifero
    include Carnivoro
end

class Perro < Mamifero
    include Nadador
    include Carnivoro
end 

#1 class Perro
#1    extend Nadador
#1 end

#1 puts Perro.nadar
