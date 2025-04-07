# Script: import-fv.R
# Author: LMN
# Maintainer: LMN
# Date: 2025-04-07
# ---------------------------------------

library(googlesheets4)
library(dplyr)

# Autenticación (asegúrate de usar tu cuenta con acceso a la hoja)
gs4_auth(email = "luism@kilometro0.org")

# URL o ID de la hoja de Google
sheet_url <- "https://docs.google.com/spreadsheets/d/XXXXXXXXXXXXXXX/edit?usp=sharing"

# Ver los nombres de las hojas disponibles
sheet_names(sheet_url)

# Leer la hoja específica (por ejemplo, "mecanismo de muerte 2024")
data <- read_sheet(sheet_url, sheet = "mecanismo de muerte 2024")

# Vista previa de los datos
head(data)

