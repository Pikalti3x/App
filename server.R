library(shiny)
library(ggplot2)

function(input, output) {
  
  output$summary <- renderTable({
    
    req(input$mainfile)
    
    tryCatch(
      {
        infos = c()
        sequences = c()
        qualities <- c()
        skip = c()
        
        read_file <- readLines(input$mainfile$datapath)
        
        i = 1
        for(a in read_file){
          #print(i)
          infos = c(infos,read_file[i])
          sequences = c(sequences,read_file[i+1])
          skip = c(skip,read_file[i+2])
          qualities <- c(qualities,read_file[i+3])
          i <- i + 4
        }
        df <- data.frame(infos,sequences,skip,qualities)
        df <- setNames(df, c("infos","sequences","skip","qualities"))
        #print(df)
      },
      error = function(e) {
        stop(safeError(e))
      }
    )
    
    df <- df[!is.na(df$skip),]
    
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }
    
  })
}

