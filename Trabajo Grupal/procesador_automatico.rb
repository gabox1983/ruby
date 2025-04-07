#Clase para procesar texto automatico
class ProcesadorAutomatico
  #Guarda objeto de reporte para uso mas adelante
  def initialize(reporte)
    @reporte = reporte
  end

  #Metodo principal para procesar archivo de texto
  def procesar
    #Pide al usuario el nombre del archivo a leer
    print "Nombre del archivo (ej: texto.txt): "
    nombre = gets.chomp

    #Verifica si archivo existe
    if !File.exist?(nombre)
      puts "Archivo no encontrado."
      return
    end

    #Lee el contenido del archivo
    texto = File.read(nombre)
    
    #Calcula las estadísticas del texto
    palabras = texto.split                                  #Todas las palabras
    oraciones = texto.scan(/[.!?]/).count                   #Cantidad de oraciones
    caracteres = texto.length                               #Caracteres totales
    sin_espacios = texto.gsub(/[^a-zA-Z]/, "").length       #Solo letras (sin símbolos ni espacios)
    mayusculas = palabras.count { |p| p[0] =~ /[A-Z]/ }     #Palabras que empiezan con mayúscula
    minusculas = palabras.count { |p| p[0] =~ /[a-z]/ }     #Palabras que empiezan con minúscula
    digitos = texto.scan(/\d/).count                        #Números encontrados

    puts "\n--- RESULTADO AUTOMÁTICO ---"
    puts "Palabras: #{palabras.length}"
    puts "Oraciones: #{oraciones}"
    puts "Caracteres totales: #{caracteres}"
    puts "Caracteres sin símbolos: #{sin_espacios}"
    puts "Palabras con mayúscula: #{mayusculas}"
    puts "Palabras con minúscula: #{minusculas}"
    puts "Dígitos encontrados: #{digitos}"
    
    #Guardar el texto original en un archivo
    File.write("reporte_automatico.txt", texto)

    #Registrar el uso en el sistema de reporte
    @reporte.registrar('automático', caracteres, 0)
  end
end
