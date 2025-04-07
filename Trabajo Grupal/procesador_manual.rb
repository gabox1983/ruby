#Clase para procesar texto manualmente
class ProcesadorManual
  def initialize(reporte)
    #Se guarda el objeto del reporte
    @reporte = reporte  
  end

  #Menu interactivo para el usuario
  def interactivo
    print "Nombre del archivo (ej: texto.txt): "
    archivo = gets.chomp

    #Verifica si el archivo existe
    return puts "No existe." unless File.exist?(archivo)

    #Lee el archivo
    texto = File.read(archivo)  

    loop do
      
      puts "\n--- MENÚ MANUAL ---"
      puts "1. Buscar palabra"
      puts "2. Reemplazar vocales"
      puts "3. Volver"
      print "Opción: "
      op = gets.chomp

      #Ejecutar segun opción elegida
      case op
      when "1"
        buscar(texto)
      when "2"
        reemplazar(texto)
      when "3"
        break  #Salir del menu manual
      else
        puts "Opción inválida"
      end
    end
  end

  #Busca una palabra o frase en el texto
  def buscar(texto)
    print "Palabra o frase: "
    palabra = gets.chomp
    cantidad = texto.scan(/#{Regexp.escape(palabra)}/i).count
    puts "Encontrado #{cantidad} vez/veces."
    
    #Registrar el uso
    @reporte.registrar('manual', palabra.length, 0)  
  end

  #Reemplaza las vocales por otras
  def reemplazar(texto)
    print "Vocal a cambiar: "
    original = gets.chomp
    print "Vocal nueva: "
    nueva = gets.chomp

    #Reemplaza la vocal original por la nueva
    nuevo_texto = texto.gsub(original, nueva)

    #Muestra el nuevo texto
    puts "\nTexto cambiado:"
    puts nuevo_texto

    #Guarda el nuevo texto en un archivo
    File.write("reporte_manual.txt", nuevo_texto)

    #Registra el uso
    @reporte.registrar('manual', texto.length, texto.count(original))
  end
end
