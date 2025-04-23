# Script: clean-fv.R
# Author: LMN
# Maintainer: LMN
# Date: 2025-04-08
# ---------------------------------------

# --- libs
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")
pacman::p_load(
               argparse,
               dplyr,
               data.table,
               janitor,
               stringr,
               lubridate)

# args 
parser <- ArgumentParser()
parser$add_argument("--input")
parser$add_argument("--output")
args <- parser$parse_args()


df <- fread(args$input)  %>%
    clean_names()  %>% # snake_case, sin espacios, sin símbolos raros  
    mutate(across(where(is.character), str_to_lower)) %>%
    mutate(across(where(is.character), str_trim))  %>%
    mutate(across(where(is.character), ~ na_if(str_trim(.), "")))  %>%
    select(where(~ !all(is.na(.))))  %>%

    select(id_number,
           nom,
           edad,
           sexo,
           fecha_rip,
           ano_rip,
           muni_resi,
           ano_rip,
           jurisdiccion,
           mecanismo,
           crisis, 
           m_arma_f)  %>%

    rename(
           nombre = nom,
           armed = m_arma_f)  %>%

    mutate(
           id_number = as.factor(id_number),
           edad = as.numeric(edad), 
           sexo = factor(sexo, levels = c("m", "f")),
           armed = factor(armed, levels = c("si", "no")),
           fecha_rip = ymd(fecha_rip),
           ano_rip = year(fecha_rip)
           )  %>%

    distinct(id_number, .keep_all = TRUE)


# output 
fwrite(df, args$output)

# done 
