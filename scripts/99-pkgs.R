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
         'modelr',
         'party',
         'rpart',
         'ggpubr',
         'ggparty',
         'partykit',
         'tenzing',
         'plotrix',
         'rgbif'
         )

eval(
  parse(text =  
          glue::glue('suppressPackageStartupMessages(library({pkg}))')))

                                 
                                 






