library(shiny)
library(ggplot2)

fluidPage(theme = "bootstrap.css",
  #titlePanel("Application"),
  fluidRow(
    column(12,
          
          ###
          navbarPage("Bioinformatics .",tabPanel("Waiting 1"),tabPanel("Waiting 2"),
                      navbarMenu("More",tabPanel("Sub-Waiting A"),tabPanel("Sub-Waiting B"))
                    ),
          
          ###
          sidebarPanel(
                      fileInput("mainfile", "Choose FastQ File",multiple = FALSE,
                                  accept = c("text/fq",".fq")),
                      tags$hr(),
                      radioButtons("disp", "Display",choices = c(Head = "head",All = "all"),
                                  selected = "head")
                      ),
          ###
          mainPanel(
                      tabsetPanel(tabPanel("Basic Statistis", tableOutput("summary")),
                                  tabPanel("Plot", plotOutput("plot")), 
                                  tabPanel("Table", tableOutput("table"))
                                )           
                    )
          ###
          
        )#Col
    )#Row
)#Page

