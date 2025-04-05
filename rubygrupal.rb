# ID DE ESTUDIANTE: 0160439
# Nombre y apellidos del estudiante: Gabriel Colmenares
# Universidad: Dewey University
# Curso: COMP 323 Trabajo grupal
# Fecha de entrega: 1 de abril de 2025
# Descripción:
# Programa que integra múltiples módulos para el procesamiento de texto.
# Incluye funciones automáticas, manuales, reemplazo en tiempo real y un
# sistema de reporte de uso. El menú principal permite al usuario acceder
# a cada funcionalidad de forma interactiva. Se utilizan clases, métodos,
# constructores, variables de instancia y control de flujo.

# =============================================
# Clase principal del programa: ProcesadorTexto
# Esta clase actúa como controlador central.
# Se encarga de cargar los módulos, ejecutar el menú
# principal y redirigir las acciones del usuario.
# =============================================
class ProcesadorTexto

  # ----------------------------------------------------------
  # Constructor de la clase (método initialize)
  # Este método se ejecuta automáticamente al crear un objeto.
  # Aquí se hace el "require_relative" de los otros archivos
  # que contienen la lógica modular, y se inicializan las
  # instancias de cada módulo, pasando como argumento un
  # objeto ReporteUtilizacion para seguimiento.
  # ----------------------------------------------------------
  def initialize
    require_relative 'procesador_automatico'    # Módulo 1: procesamiento automático
    require_relative 'procesador_manual'        # Módulo 2: entrada manual/interactiva
    require_relative 'procesador_reemplazos'    # Módulo 3: reemplazos en tiempo real
    require_relative 'reporte_utilizacion'      # Módulo 4: registro y visualización del uso

    # Se crea una instancia del módulo de reporte para compartir entre los demás módulos
    @reporte = ReporteUtilizacion.new

    # Se crean instancias de los módulos principales, cada uno recibe el objeto de reporte
    @procesador_automatico = ProcesadorAutomatico.new(@reporte)
    @procesador_manual = ProcesadorManual.new(@reporte)
    @procesador_reemplazos = ProcesadorReemplazos.new(@reporte)
  end

  # ----------------------------------------------------------
  # Método principal del programa: mostrar_menu
  # Muestra el menú al usuario, solicita la opción deseada,
  # y llama al método correspondiente del módulo según la selección.
  # Utiliza un bucle loop para seguir ejecutando hasta que el usuario
  # seleccione la opción de "Salir".
  # ----------------------------------------------------------
  def mostrar_menu
    loop do
      # Despliegue de opciones al usuario
      puts "\n=== MENÚ PRINCIPAL ==="
      puts "1. Procesador de Texto Automático"
      puts "2. Procesador de Texto Manual"
      puts "3. Procesador de Reemplazos"
      puts "4. Reporte de Utilización"
      puts "5. Salir"
      print "Seleccione una opción: "

      # Captura de opción ingresada por el usuario
      opcion = gets.chomp

      # Decisión basada en la opción ingresada
      case opcion
      when "1"
        @procesador_automatico.procesar  # Llama al método del módulo 1
      when "2"
        @procesador_manual.interactivo  # Llama al método del módulo 2
      when "3"
        @procesador_reemplazos.reemplazar_en_tiempo_real  # Llama al método del módulo 3
      when "4"
        @reporte.mostrar  # Muestra estadísticas de uso (módulo 4)
      when "5"
        puts "Saliendo del programa. ¡Hasta luego!"
        break  # Rompe el bucle y termina el programa
      else
        puts "Opción inválida. Intente de nuevo."  # Validación si la opción no es válida
      end
    end
  end
end

# ==========================================================
# Punto de entrada del programa (main)
# Esta es la línea donde comienza la ejecución cuando se
# corre directamente el archivo (no cuando se importa).
# Se instancia la clase principal y se llama al menú.
# ==========================================================
if __FILE__ == $0
  app = ProcesadorTexto.new  # Crea objeto de la clase principal
  app.mostrar_menu           # Inicia el menú de navegación
end