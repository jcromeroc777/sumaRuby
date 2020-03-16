require 'json'

# Iterador que no permite salir del ciclo hasta que los datos sean válidos
iterator = 0
# Array que almacena las posiciones de la suma correcta
positions = []

# Se encarga de pedir los datos al usuario
while iterator == 0 do 
    begin
        puts "Introduce el arreglo de numeros. Ejemplo: [2, 7, 11, 15]"  
        numbersString = gets
        numbers = JSON.parse(numbersString)
        puts "Ahora introduce el número de resultado"
        targetString = gets
        target = targetString.to_i
        if numbers.class == Array
            iterator = 1
        end
    rescue Exception => msg  
        puts "Arreglo inválido" 
    end 
end

# Iteración del arreglo de números para obtener el target
numbers.each_with_index do |number, position|
    # Número para buscar dentro del arreglo que complemente al target
    search = target - number

    # Iteración para encontrar el segundo numero que de como resultado el target al sumarlo
    numbers.each_with_index do |numberTwo, positionTwo|
        if search == numberTwo
            positions = [position+1, positionTwo+1]
        end
    end

end

# Imprimir el resultado de las posiciones de los numeros que sumados son igual al target
puts "Resultado: Index1 = #{positions[1]}, Index2 = #{positions[0]}"