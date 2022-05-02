
def letra_o(niveles)
    for i in 1..niveles do
        for j in 1..niveles do
            if i==1 or i==niveles
                print "*"
            else
                print (j==1 or j==niveles)? "*":" "
            end
        end
        puts ""
    end
end

def letra_i (niveles)
    for i in 1..niveles do
        for j in 1..niveles do
            if i==1 or i==niveles
                print "*"
            else
                if (niveles.even? && (j==niveles/2 or j==niveles/2+1)) or (!niveles.even? && j==niveles/2+1)
                    print "*"
                else
                    print " "
                end
            end
        end
        puts ""
    end
end

def letra_z(niveles)
    for i in 1..niveles do
        for j in 1.. niveles do
            if i==1 or i==niveles
                print "*"
            else
                print (niveles-j+1==i)? "*":" "
            end
        end
        puts ""
    end
end

def letra_x (niveles)
    for i in 1..niveles do
        for j in 1..niveles do
            print (j==i or j==niveles-i+1)? "*":" "
        end
        puts ""
    end
end

def numero_0(niveles)
    for i in 1..niveles do
        for j in 1..niveles do
            if i==1 or i==niveles or i==j
                print "*"
            else
                print (j==1 or j==niveles)? "*":" "
            end
        end
        puts ""
    end
end

def navidad (niveles)
    for i in 1..niveles/2 do
        for j in 1..niveles do
            if !(j-i).even? and j-i<=niveles/2 and j > niveles/2 - i
                print "X"
            else
                print " "
            end
        end
        puts ""
    end
end

system("clear")
puts "Patrones disponibles:"
puts "[O]"
puts "[I]"
puts "[Z]"
puts "[X]"
puts "[0]"
puts "[N]avidad"
puts "Ingrese opción: "
opcion = gets.chomp
puts "Ingrese niveles: "
niveles = gets.chomp
puts opcion, niveles
