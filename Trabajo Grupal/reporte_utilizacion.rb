#Clase para llevar un reporte de uso del programa (LOG FILE)
class ReporteUtilizacion
  def initialize
    #Contador de cuantas veces se uso cada modulo
    @usos = {
      'automático' => 0,
      'manual' => 0,
      'reemplazos' => 0
    }
    #Total de caracteres analizados
    @caracteres = 0         
    #Total de reemplazos realizados
    @reemplazos = 0         
  end

  #Metodo para registrar el uso de un modulo
  def registrar(tipo, caracteres, reemplazos)
    
    #Aumenta el contador del módulo
    @usos[tipo] += 1          
    
    #Suma caracteres buscados
    @caracteres += caracteres 
   
    #Suma reemplazos hechos
    @reemplazos += reemplazos 
  end

  #Muestra el reporte en pantalla
  def mostrar
    puts "\n--- REPORTE ---"
    @usos.each do |tipo, veces|
      puts "#{tipo.capitalize}: #{veces} vez/veces"
    end
    puts "Caracteres buscados: #{@caracteres}"
    puts "Reemplazos hechos: #{@reemplazos}"
  end
end
