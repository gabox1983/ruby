**ID DE ESTUDIANTE:** 0160439  
**NOMBRE Y APELLIDOS:** Gabriel Colmenares  
**UNIVERSIDAD:** Dewey University  
**CURSO:** COMP 323 - Trabajo Grupal  
**FECHA DE ENTREGA:** 4 de abril de 2025  

## 📌 DESCRIPCIÓN DEL PROYECTO

Este proyecto es una aplicación en Ruby que permite el **procesamiento modular de archivos de texto** mediante una interfaz de menú interactivo en la terminal. El sistema está dividido en varios módulos especializados para diferentes tareas, facilitando así la organización del código, su mantenimiento y escalabilidad.

El programa permite:
- Procesamiento automático de estadísticas del texto.
- Procesamiento manual con entradas personalizadas del usuario.
- Reemplazo de contenido en tiempo real.
- Generación de reportes sobre el uso del sistema.

---

## 🧱 ESTRUCTURA DEL SISTEMA

```
.
├── main.rb                      # Clase principal (ProcesadorTexto)
├── procesador_automatico.rb     # Módulo de análisis automático
├── procesador_manual.rb         # Módulo de interacción manual
├── procesador_reemplazos.rb     # Módulo de reemplazo en tiempo real
├── reporte_utilizacion.rb       # Módulo de reporte de uso
└── archivos/
    └── texto_prueba.txt         # Archivo(s) de entrada
```

---

## 🧩 DESCRIPCIÓN DE MÓDULOS

### 🔹 `ProcesadorTexto` (Clase principal)
- Controlador central del sistema.
- Carga los módulos necesarios usando `require_relative`.
- Inicializa las instancias de cada módulo y el sistema de reportes.
- Muestra el menú de navegación al usuario y gestiona el flujo del programa.

### 🔹 `ProcesadorAutomatico`
- Realiza análisis de texto sin intervención del usuario.
- Calcula estadísticas como conteo de palabras, letras, símbolos, etc.

### 🔹 `ProcesadorManual`
- Permite al usuario buscar frases y hacer reemplazos específicos.
- Se adapta a la entrada del usuario con opciones interactivas.

### 🔹 `ProcesadorReemplazos`
- Reemplaza palabras o caracteres en tiempo real.
- Muestra una vista previa de los cambios.

### 🔹 `ReporteUtilizacion`
- Lleva el conteo de cuántas veces se usan los diferentes módulos.
- Muestra un reporte consolidado con estadísticas de uso.

---

## 🎮 MENÚ INTERACTIVO

Al ejecutar el programa, se presenta un menú en consola con las siguientes opciones:

1. Procesador de Texto Automático  
2. Procesador de Texto Manual  
3. Procesador de Reemplazos  
4. Reporte de Utilización  
5. Salir  

Cada opción invoca métodos específicos dentro de los módulos correspondientes. El menú se repite hasta que el usuario decide salir.

---

## 🧪 TECNOLOGÍAS UTILIZADAS

- **Lenguaje:** Ruby  
- **Paradigma:** Programación Orientada a Objetos  
- **Recursos:**  
  - `gets.chomp` para capturar entradas del usuario  
  - Uso de `case` para control de flujo  
  - Modularización con `require_relative`  
  - Buenas prácticas de codificación y documentación  

---

## ▶️ CÓMO USAR EL PROGRAMA

1. Asegúrate de tener Ruby instalado:  
   ```bash
   ruby -v
   ```

2. Ejecuta el archivo principal:  
   ```bash
   ruby main.rb
   ```

3. Selecciona una opción del menú para comenzar a utilizar los módulos.

---

## ✅ BUENAS PRÁCTICAS IMPLEMENTADAS

- Modularización del código por responsabilidad.
- Uso de clases y objetos con principios de OOP.
- Comentarios claros y descriptivos en cada sección del código.
- Validación de entradas del usuario.
- Reutilización de objetos (como el reporte) para evitar redundancia.

---

## 📩 AUTOR

**Gabriel Colmenares**  
Estudiante de Programación - Dewey University  
