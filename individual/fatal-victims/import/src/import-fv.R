# Script: import-fv.R
# Author: LMN
# Maintainer: LMN
# Date: 2025-04-07
# ---------------------------------------
# --- libs
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")
pacman::p_load(
               here, dplyr, data.table, googledrive, readxl, arrow, argparse, stringr)


# args {{{
parser <- ArgumentParser()
parser$add_argument("--output", default = "output/fatal-victims.csv")
args <- parser$parse_args()
# }}}


# Auth
drive_auth(email = Sys.getenv("WORK_EMAIL"))

# 2. Identify folder --? file 
folder <- drive_find(
  q = "name contains 'NO EDITAR - Versión pública' and mimeType = 'application/vnd.google-apps.folder'",
  corpora = "allDrives",
  includeItemsFromAllDrives = TRUE
)  %>% pull(id)

file <- drive_find(
  q = sprintf(
              "'%s' in parents and mimeType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'",
              folder),
  corpora = "allDrives",
  includeItemsFromAllDrives = TRUE
)  %>% pull(id)


# 4. Descargar archivo (temporal) 
tmp_path <- tempfile(fileext = ".xlsx")
drive_download(as_id(file), path = tmp_path, overwrite = TRUE)

# 5. output 
fv <- read_excel(tmp_path,
                 sheet = "2. Casos de víctimas fatales",
                 skip = 1
)

out <- fv %>%
  filter(!is.na(`ID#`) & str_detect(as.character(`ID#`), "^\\d{2}-\\d{3}$"))


fwrite(out, args$output)

# done 
