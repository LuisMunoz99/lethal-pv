# Lethal Police Violence in Puerto Rico  (project still in process) 

This repository contains the scripts and files needed to **import, clean, and analyze** data on police-related fatal incidents documented by Kilómetro Cero. The goal is to enable anyone—regardless of programming experience—to run the workflow and produce a statistical report.

- **import-fv.R**: Downloads data from Google Drive and saves it in CSV format.  
- **clean-fv.R**: Cleans and transforms the data.  
- **licence-to-kill.Rmd**: Generates a report with graphs and statistics on police-related fatalities.

## `WORK_EMAIL` Environment Variable
To authenticate with Google Drive, you need to set an environment variable called `WORK_EMAIL` with your authorized email (e.g., `(yourname@domain.com)`). This allows the `import-fv.R` script to access the spreadsheet containing the original data.

## Further Information

See the **Manual** (located in the `docs` folder or elsewhere in this repository) for detailed instructions on:

- Installing R and RStudio  
- Setting up `WORK_EMAIL`  
- Step-by-step execution of each script  
- Understanding the final report  

---
© 2025 - Fatal Victims of Police Project (Kilómetro Cero).   
