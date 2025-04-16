```markdown
# Manual Detallado de Uso
Este manual explica, **paso a paso**, cómo cualquier persona puede **importar**, **limpiar** y **analizar** datos de víctimas fatales documentadas en Kilómetro Cero

## Índice
1. [Objetivo del Manual](#1-objetivo-del-manual)  
2. [Requisitos y Preparación](#2-requisitos-y-preparación)  
   1. [Instalación de R y RStudio](#21-instalación-de-r-y-rstudio)  
   2. [Clonar o Descargar el Proyecto](#23-clonar-o-descargar-el-proyecto)  
3. [Estructura de Archivos](#3-estructura-de-archivos)  
4. [Ejecutar el Proceso Paso a Paso](#4-ejecutar-el-proceso-paso-a-paso)  
   1. [Importar Datos (`import-fv.R`)](#41-importar-datos-import-fvr)  
   2. [Limpiar Datos (`clean-fv.R`)](#42-limpiar-datos-clean-fvr)  
   3. [Generar Informe (`licence-to-kill.Rmd`)](#43-generar-informe-licence-to-killrmd)  
5. [Interpretación del Informe](#5-interpretación-del-informe)  
6. [Resolución de Problemas Comunes](#6-resolución-de-problemas-comunes)  
7. [Comentarios Finales](#7-comentarios-finales)

---

## 1. Objetivo del Manual
El propósito de este manual es:

- **Explicar** como completar los siguientes procesos:
  1. Descargar datos sobre victimas fatales por la policia desde Google Drive y convertirlos a un formato `.csv`.
  2. Limpiar y procesar los datos.
  3. Generar un informe final con gráficos y estadísticas.

- **Orientar** a personas sin experiencia en programación, de modo que puedan reproducir o actualizar el análisis cuando sea necesario.

---
## 2. Requisitos y Preparación

### 2.1 Instalación de R y RStudio
1. **Instalar R**  
   - Visita el sitio oficial de [CRAN](https://cran.r-project.org/).  
   - Selecciona tu sistema operativo (Windows, macOS o Linux).  
   - Sigue las instrucciones o el asistente de instalación provisto.

2. **Instalar RStudio** (Opcional pero recomendable)  
   - Descarga RStudio Desktop en:  
     [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)  
   - Ejecuta el instalador (en Windows o macOS) o sigue las instrucciones específicas para tu distribución de Linux.  
   - Abrirás tu proyecto en RStudio para facilitar la ejecución de los scripts y la compilación del informe.

### 2.2 Clonar o Descargar el Proyecto

1. **Clonar con Git** (si tienes Git instalado):
   ```bash
   git clone git@github.com:LuisMunoz99/lethal-pv.git
   ```
2. **Descargar ZIP**  
   - Desde la página de GitHub, busca la opción “Code” > “Download ZIP”.  
   - Extrae el contenido donde prefieras.

---
## 3. Estructura de repositorio
Al ubicarte en la carpeta raíz del repositorio, encontrarás una distribución semejante a:

```
lethal-pv/
├── docs
│   └── manual.md    <-- Este documento
├── individual
│   └── fatal-victims
│       ├── import
│       │   ├── src
│       │   │   └── import-fv.R
│       │   └── output
│       ├── clean
│       │   ├── src
│       │   │   └── clean-fv.R
│       │   └── output
│       └── ...
└── write
    └── lpm
        └── src
            └── licence-to-kill.Rmd
```

- **`import-fv.R`**: Carga y convierte el archivo Excel en .csv.  
- **`clean-fv.R`**: Limpia y transforma el .csv para generar un archivo final.  
- **`licence-to-kill.Rmd`**: Documento R Markdown que procesa el archivo limpio y produce el informe estadístico en HTML o PDF.

El proyecto utiliza la librería [`here`](https://cran.r-project.org/package=here) para manejar rutas, lo que simplifica el acceso a archivos sin depender de rutas absolutas.
# Manual Detallado de Uso
Este manual explica, **paso a paso**, cómo cualquier persona puede **importar**, **limpiar** y **analizar** datos de víctimas fatales documentadas en Kilómetro Cero

## Índice
1. [Objetivo del Manual](#1-objetivo-del-manual)  
2. [Requisitos y Preparación](#2-requisitos-y-preparación)  
   1. [Instalación de R y RStudio](#21-instalación-de-r-y-rstudio)  
   2. [Clonar o Descargar el Proyecto](#22-clonar-o-descargar-el-proyecto)  
3. [Estructura de Archivos](#3-estructura-de-archivos)  
4. [Ejecutar el Proceso Paso a Paso](#4-ejecutar-el-proceso-paso-a-paso)  
   1. [Importar Datos (`import-fv.R`)](#41-importar-datos-import-fvr)  
   2. [Limpiar Datos (`clean-fv.R`)](#42-limpiar-datos-clean-fvr)  
   3. [Generar Informe (`licence-to-kill.Rmd`)](#43-generar-informe-licence-to-killrmd)  
5. [Interpretación del Informe](#5-interpretación-del-informe)  
6. [Resolución de Problemas Comunes](#6-resolución-de-problemas-comunes)  
7. [Comentarios Finales](#7-comentarios-finales)

---

## 1. Objetivo del Manual
El propósito de este manual es:

- **Explicar** cómo completar los siguientes procesos:
  1. Descargar datos sobre víctimas fatales por la policía desde Google Drive y convertirlos a un formato `.csv`.
  2. Limpiar y procesar los datos.
  3. Generar un informe final con gráficos y estadísticas.

- **Orientar** a personas sin experiencia en programación, de modo que puedan reproducir o actualizar el análisis cuando sea necesario.

---

## 2. Requisitos y Preparación

### 2.1 Instalación de R y RStudio
1. **Instalar R**  
   - Visita el sitio oficial de CRAN:  
     https://cran.r-project.org/  
   - Selecciona tu sistema operativo (Windows, macOS o Linux).  
   - Sigue las instrucciones o el asistente de instalación provisto.

2. **Instalar RStudio** (Opcional pero recomendable)  
   - Descarga RStudio Desktop en:  
     https://posit.co/download/rstudio-desktop/  
   - Ejecuta el instalador (en Windows o macOS) o sigue las instrucciones específicas para tu distribución de Linux.  
   - Abrirás tu proyecto en RStudio para facilitar la ejecución de los scripts y la compilación del informe.

### 2.2 Clonar o Descargar el Proyecto

1. **Clonar con Git** (si tienes Git instalado):

    git clone git@github.com:LuisMunoz99/lethal-pv.git

2. **Descargar ZIP**  
   - Desde la página de GitHub, busca la opción “Code” > “Download ZIP”.  
   - Extrae el contenido donde prefieras.

---

## 3. Estructura de Archivos
Al ubicarte en la carpeta raíz del repositorio, encontrarás una distribución semejante a:

    lethal-pv/
    ├── docs
    │   └── manual.md    <-- Este documento
    ├── individual
    │   └── fatal-victims
    │       ├── import
    │       │   ├── src
    │       │   │   └── import-fv.R
    │       │   └── output
    │       ├── clean
    │       │   ├── src
    │       │   │   └── clean-fv.R
    │       │   └── output
    │       └── ...
    └── write
        └── lpm
            └── src
                └── licence-to-kill.Rmd

- **import-fv.R**: Carga y convierte el archivo Excel en .csv.  
- **clean-fv.R**: Limpia y transforma el .csv para generar un archivo final.  
- **licence-to-kill.Rmd**: Documento R Markdown que procesa el archivo limpio y produce el informe estadístico en HTML o PDF.

El proyecto utiliza la librería [here](https://cran.r-project.org/package=here) para manejar rutas, lo que simplifica el acceso a archivos sin depender de rutas absolutas.

---

## 4. Ejecutar el Proceso Paso a Paso

### 4.1 Importar Datos (`import-fv.R`)

1. Abre RStudio y ve a la pestaña “Files” (o panel de archivos).
2. Navega hasta la carpeta `individual/fatal-victims/import/src/`.
3. Abre el archivo `import-fv.R`.  
   - En su interior verás:
     - Autenticación con **googledrive**.
     - Búsqueda de una carpeta en Google Drive.
     - Descarga de un archivo Excel (rango `A2:AK120`).
     - Exportación a `fatal-victims.csv`.
4. Inserta en el espacio "WORK_EMAIL" tu correo autorizado.
5. Ejecuta el script:
   - Selecciona todo (Ctrl + A) y pulsa *Run* en la esquina superior derecha del panel de RStudio.
6. Autenticación:
   - Se abrirá tu navegador para que inicies sesión con el correo configurado en `WORK_EMAIL`. Dale acceso a la aplicación.
7. Archivo Importado:
   - Se crea `fatal-victims.csv` en `./individual/fatal-victims/import/output/`.

### 4.2 Limpiar Datos (`clean-fv.R`)

1. Desde RStudio, ve a `./individual/fatal-victims/clean/src/`.
2. Abre el archivo `clean-fv.R`.  
   - Observa que usa librerías como `janitor`, `stringr` y `lubridate` para corregir mayúsculas/minúsculas, eliminar espacios, convertir fechas, etc.
3. Ejecuta el script (mismo procedimiento que el anterior).
4. Archivo Limpio:
   - Al final, se genera un archivo `fatal-victims-final.csv` en `./individual/fatal-victims/clean/output/`.
   - Este será la base para el análisis e informe.

### 4.3 Generar Informe (`licence-to-kill.Rmd`)

1. Ve a `./write/lpm/src/`.
2. Abre `licence-to-kill.Rmd` en RStudio.
3. Compila el documento:
   - Pulsa el botón *Knit* (barra superior en RStudio).
   - Elige si quieres un informe en **HTML** (recomendado) o en **PDF** (requiere tener LaTeX instalado en muchos casos).
4. Informe Final:
   - Se generará un archivo, por ejemplo `licence-to-kill.html`, con los gráficos y tablas del análisis.

---

## 5. Interpretación del Informe

Al abrir el informe final (HTML o PDF), encontrarás:

- **Introducción**: Contexto temporal (2014–2024) y objetivos del estudio.  
- **Distribución por Mecanismo de Muerte**: Gráfico treemap que muestra cuántos casos se asocian a cada medio (por ejemplo, arma de fuego reglamentaria, otro tipo de arma, etc.).  
- **Tendencias Anuales**: Un gráfico de barras que compara la cantidad de muertes por año, para observar variaciones temporales.  
- **Firearm Deaths: Armed vs. Unarmed**: Pie chart (gráfico circular) que muestra la proporción de víctimas que estaban armadas versus las que no lo estaban.  
- **Distribución de Edad**: Un diagrama de barras agrupado en rangos de edad para ver qué grupos poblacionales han sido más afectados.

Cada gráfico incluye títulos y etiquetas que ayudan a su interpretación sin conocimientos técnicos. Además, se utilizan colores contrastantes para resaltar categorías clave (por ejemplo, unarmed vs. armed).

---

## 6. Resolución de Problemas Comunes

- **No se encuentra el archivo en Google Drive**  
  - Asegúrate de que tu variable `WORK_EMAIL` esté configurada correctamente y hayas iniciado sesión con la cuenta autorizada.
  - Verifica que los archivos existan en la carpeta de Google Drive identificada por “NO EDITAR - Versión pública”.

- **Error al compilar el informe (`licence-to-kill.Rmd`)**  
  - Confirma que las librerías (por ejemplo, `tidyverse`, `ggplot2`, `treemapify`, etc.) estén instaladas.
  - Si compilas a PDF y ocurre un error, quizás te falte LaTeX. Intenta compilar primero a HTML.

- **Rutas de archivo no encontradas**  
  - Comprueba que has abierto el proyecto en la carpeta raíz.
  - Verifica que `here::here()` apunta correctamente a los directorios `import/output`, `clean/output`, etc.

---

## 7. Comentarios Finales

1. **Validación**:  
   Prueba estos pasos en un equipo limpio (sin configuraciones previas) para asegurar que el proceso sea fácil de seguir por alguien sin experiencia en programación.

2. **Actualizaciones**:  
   Si cambian columnas o se amplía el rango de celdas en el Excel, ajusta `import-fv.R` según corresponda y anota esos cambios en los comentarios del script.

3. **Transparencia y Colaboración**:  
   Se recomienda versionar cada cambio en Git, abriendo issues o pull requests para que todos los colaboradores se enteren de cada modificación.

4. **Dónde encontrar ayuda**:  
   - Consulta https://community.rstudio.com/ si tienes preguntas sobre RStudio.
   - Abre un issue en GitHub para documentar cualquier incidencia, proponiendo mejoras si es necesario.

¡Gracias por tu compromiso con la transparencia de datos!

