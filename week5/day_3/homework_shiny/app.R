library(shiny)
library(shinythemes)
library(tidyverse)
library(CodeClanData)
update_geom_defaults("point", list(size = 10))

ui <- fluidPage(
    theme = shinytheme("cosmo"),
    
    titlePanel("Title"),
    tabsetPanel(
        
        tabPanel("First Tab",
                 "Contetn"),
        tabPanel("Second Panel",
                 fluidRow(
                     column(5,
                            radioButtons("season",
                                         tags$i("Summer or Winter Olympics?"),
                                         choices = c("Summer","Winter")),
                     ),
                     column(4,
                            radioButtons("medal",
                                         tags$i("Which Medal?"),
                                         choices = c("Gold","Silver","Bronze"))
                     ),
                     column(3,
                            tags$a("CodeClan's Website", href = "https://codeclan.com/")
                     )
                 ),
                 fluidRow(
                     plotOutput("medal_plot")
                 )
                 
        ),
        tabPanel("Third Panel",
                 fluidRow(
                     column(4,
                            fluidRow(
                                column(6,
                                       radioButtons("season2",
                                                    tags$i("Summer or Winter Olympics?"),
                                                    choices = c("Summer","Winter"))),
                                column(6,
                                       radioButtons("medal2",
                                                    tags$i("Which Medal?"),
                                                    choices = c("Gold","Silver","Bronze")))
                            )),
                     column(8,
                            plotOutput("medal_plot2"))
                 )
        )
        
    )
)



server <- function(input, output) {
    
    output$medal_plot <- renderPlot({
        olympics_overall_medals %>%
            filter(team %in% c("United States",
                               "Soviet Union",
                               "Germany",
                               "Italy",
                               "Great Britain")) %>%
            filter(medal ==input$medal ) %>%
            filter(season == input$season) %>%
            ggplot() +
            aes(x = team, y = count,fill = team) +
            geom_col()
    })
    
    #second plot -> panel three
    output$medal_plot2 <- renderPlot({
        olympics_overall_medals %>%
            filter(team %in% c("United States",
                               "Soviet Union",
                               "Germany",
                               "Italy",
                               "Great Britain")) %>%
            filter(medal ==input$medal2 ) %>%
            filter(season == input$season2) %>%
            ggplot() +
            aes(x = team, y = count,color = team, size = count) +
            update_geom_defaults("point", list(size = 10))+
            geom_point()+
            scale_size_continuous(range = c(5,20))
    })
    
    
    
}

shinyApp(ui = ui, server = server)