#Clase para hacer reemplazos en tiempo real
class ProcesadorReemplazos
  def initialize(reporte)
    #Guardar el objeto del reporte
    @reporte = reporte  
  end

  #Metodo principal para reemplazos
  def reemplazar_en_tiempo_real
    print "Nombre del archivo: "
    archivo = gets.chomp

    return puts "No existe." unless File.exist?(archivo)
    
    #Leer el texto del archivo
    texto = File.read(archivo)  

    loop do
      #Muestra el texto actual
      puts "\nTexto actual:"
      puts texto

      #Menu de opciones
      puts "\n1. Reemplazar"
      puts "2. Volver"
      print "Opción: "
      op = gets.chomp

      case op
      when "1"
        print "Texto original: "
        original = gets.chomp
        print "Texto nuevo: "
        nuevo = gets.chomp

        #Reemplaza texto original con nuevo
        texto = texto.gsub(original, nuevo)

        puts "\nTexto actualizado:"
        puts texto

        #Registrar el reemplazo
        @reporte.registrar('reemplazos', 0, 1)
      when "2"
        break  #Salida del módulo
      else
        puts "Opción inválida"
      end
    end
  end
end
