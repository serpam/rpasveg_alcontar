# Load packages 

pkg <- c('grateful', 
         'here', 
         'tidyverse', 
         'readxl', 
         'DT',
         'knitr',
         'kableExtra',
         'ggtext',
         'patchwork',
         'Metrics',
         'party',
         'rpart',
         'ggparty',
         'partykit',
         'tenzing',
         'plotrix'
         )

eval(
  parse(text =  
          glue::glue('suppressPackageStartupMessages(library({pkg}))')))

                                 
                                 






