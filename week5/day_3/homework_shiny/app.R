library(shiny)
library(shinythemes)

source("helpers.R")


ui <- fluidPage(
    theme = shinytheme("lumen"),
    
    titlePanel(tags$h1("Five Country Medal Comparison")),
    tabsetPanel(
        
        tabPanel("Data Source",
                 fluidRow(
                     column(12,
                            align = "center",
                            tableOutput("table")
                         
                     )
                 )
        ),
        tabPanel("Bar plot",
                 fluidRow(
                     column(5,
                            radioButtons("season",
                                         tags$i("Summer or Winter Olympics?"),
                                         choices = season
                                         ),
                     ),
                     column(4,
                            radioButtons("medal",
                                         tags$i("Which Medal?"),
                                         choices = medals)
                     ),
                     column(3,
                            tags$a("CodeClan's Website", href = "https://codeclan.com/")
                     )
                 ),
                 fluidRow(
                     plotOutput("medal_plot")
                 )
                 
        ),
        tabPanel("Buble plot",
                 fluidRow(
                     column(4,
                            fluidRow(
                                column(6,
                                       radioButtons("season2",
                                                    tags$i("Summer or Winter Olympics?"),
                                                    choices = season
                                                    )
                                       ),
                                column(6,
                                       radioButtons("medal2",
                                                    tags$i("Which Medal?"),
                                                    choices = medals
                                                    )
                                       )
                            )),
                     column(8,
                            plotOutput("medal_plot2"))
                 )
        )
        
    )
)



server <- function(input, output) {
    
    output$medal_plot <- renderPlot({
        medal_plot_1(input$medal,input$season)
    })
    
    #second plot -> panel three
    output$medal_plot2 <- renderPlot({
        medal_plot_2(input$medal2,input$season2)
    })
    
    # table output 
    output$table <- renderTable(medals_5_countries)
    
    
    
    
}

shinyApp(ui = ui, server = server)