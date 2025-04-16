# Lethal Police Violence (Kilómetro Cero)

Este repositorio contiene los scripts y archivos necesarios para **importar, limpiar y analizar** datos sobre víctimas fatales de la policia documentadas en Kilómetro Cero. El objetivo es hacer que cualquier persona interesada —incluso sin conocimientos avanzados de programación— pueda ejecutar el flujo de trabajo y obtener un informe estadístico.

- **import-fv.R**: Descarga datos desde Google Drive y los guarda en formato CSV.  
- **clean-fv.R**: Limpia y transforma datos.  
- **licence-to-kill.Rmd**: Genera un informe con gráficos y estadísticas sobre víctimas fatales de la policia.

## Variable de Entorno `WORK_EMAIL`
Para la autenticación con Google Drive, se debe configurar la variable de entorno `WORK_EMAIL` con el correo autorizado (ej., `(tunombre@dominio.com)`). Esto permite que el script `import-fv.R` acceda a la hoja de cálculo con los datos originales.

## Más Información

Consulta el **Manual** (ubicado en la carpeta `docs` o en este mismo repositorio) para ver instrucciones detalladas sobre:

- Instalación de R y RStudio  
- Configuración de `WORK_EMAIL`  
- Ejecución de cada script paso a paso  
- Interpretación del informe final  

---
© 2025 - Proyecto victimas fatales de la policia (Kilómetro Cero).  
