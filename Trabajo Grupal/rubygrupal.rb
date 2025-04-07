# ID DE ESTUDIANTE: 0160439
# Nombre y apellidos del estudiante: Gabriel Colmenares , Jeimy Lopez
# Universidad: Dewey University
# Curso: COMP 323 Trabajo grupal
# Fecha de entrega: 1 de abril de 2025
# Descripción:
# Programa integral que combina múltiples módulos especializados en el procesamiento
# de texto. Abarca procesamiento automático, entrada manual, reemplazos en tiempo real
# y generación de reportes de uso. Se basa en el paradigma orientado a objetos, haciendo 
# uso de clases, métodos, constructores, variables de instancia, control de flujo y 
# estructuras repetitivas como bucles para la interacción dinámica con el usuario.

# =============================================
# Clase principal del programa: ProcesadorTexto
# Funciona como clase controladora o central del sistema.
# Administra los diferentes módulos de procesamiento y navegación del usuario.
# Se encarga de la inicialización de componentes y el despliegue del menú.
# =============================================
class ProcesadorTexto

  # ----------------------------------------------------------
  # Constructor de la clase (initialize)
  # Este método especial se ejecuta automáticamente al instanciar la clase.
  # Aquí se utilizan 'require_relative' para importar módulos externos Ruby
  # que contienen la lógica de los distintos procesadores. También se crea
  # una instancia compartida de la clase ReporteUtilizacion, que permite
  # registrar y mostrar estadísticas de uso en todos los módulos.
  # ----------------------------------------------------------
  def initialize
    require_relative 'procesador_automatico'    # Módulo 1: procesamiento automatizado del texto
    require_relative 'procesador_manual'        # Módulo 2: ingreso y edición de texto manual
    require_relative 'procesador_reemplazos'    # Módulo 3: reemplazos de texto en tiempo real
    require_relative 'reporte_utilizacion'      # Módulo 4: seguimiento y reporte del uso del sistema

    # Instancia del módulo de estadísticas compartido con los demás módulos
    @reporte = ReporteUtilizacion.new

    # Se instancian los módulos funcionales y se les pasa el objeto de reporte como dependencia
    @procesador_automatico = ProcesadorAutomatico.new(@reporte)
    @procesador_manual = ProcesadorManual.new(@reporte)
    @procesador_reemplazos = ProcesadorReemplazos.new(@reporte)
  end

  # ----------------------------------------------------------
  # Método principal de interacción: mostrar_menu
  # Presenta un menú al usuario en consola, permitiéndole seleccionar
  # entre las distintas funcionalidades disponibles. Se utiliza un bucle
  # 'loop do' para mantener el menú activo hasta que el usuario elija salir.
  # Cada opción llama al método correspondiente en el módulo apropiado.
  # Se incluye validación para entradas incorrectas.
  # ----------------------------------------------------------
  def mostrar_menu
    loop do  # Bucle infinito para mantener el menú activo hasta que el usuario decida salir
      # Despliegue de opciones
      puts "\n=== MENÚ PRINCIPAL ==="
      puts "1. Procesador de Texto Automático"
      puts "2. Procesador de Texto Manual"
      puts "3. Procesador de Reemplazos"
      puts "4. Reporte de Utilización"
      puts "5. Salir"
      print "Seleccione una opción: "

      # Captura y almacenamiento de la opción seleccionada
      opcion = gets.chomp

      # Lógica de control de flujo (case) que redirige a los distintos módulos según la opción
      case opcion
      when "1"
        @procesador_automatico.procesar  # Ejecuta el procesamiento automático de texto
      when "2"
        @procesador_manual.interactivo  # Activa el modo de edición de texto manual/interactivo
      when "3"
        @procesador_reemplazos.reemplazar_en_tiempo_real  # Inicia el sistema de reemplazo dinámico
      when "4"
        @reporte.mostrar  # Muestra estadísticas acumuladas del uso del sistema
      when "5"
        puts "Saliendo del programa. ¡Hasta luego!"  # Mensaje de salida amigable
        break  # Rompe el bucle y termina la ejecución del menú
      else
        puts "Opción inválida. Intente de nuevo."  # Manejo de errores para entradas no válidas
      end
    end
  end
end

# ==========================================================
# Punto de entrada del programa (main)
# Esta es la sección que se ejecuta cuando se corre directamente este archivo.
# Utiliza la condición especial 'if __FILE__ == $0' que garantiza que el menú
# solo se despliegue si el archivo no está siendo importado desde otro módulo.
# Se crea una instancia de la clase principal y se llama al método del menú.
# ==========================================================
if __FILE__ == $0
  app = ProcesadorTexto.new  # Creación del objeto principal del programa
  app.mostrar_menu           # Invocación del menú para comenzar la interacción con el usuario
end
