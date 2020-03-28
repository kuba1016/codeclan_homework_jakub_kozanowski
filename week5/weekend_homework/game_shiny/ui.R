library(shiny)
# 
ui <- fluidPage(
    titlePanel(tags$h3("Games Sales 2000 - 2016")),
    tabsetPanel(
        tabPanel("Overview of the market",
                 sidebarLayout(
                     sidebarPanel(
                         "Sidebar"
                     ),
                     mainPanel(
                         "Plots"
                     )
                 )
        ),
        tabPanel("Most profitable games",
                 sidebarLayout(
                     sidebarPanel(
                         "Sidebar"
                     ),
                     mainPanel(
                         "Plots"
                     )
                 )
                 
        ),
        tabPanel("Playstation vs Microsoft",
                 sidebarLayout(
                     sidebarPanel(
                         "Sidebar"
                     ),
                     mainPanel(
                         "Plots"
                     )
                 )
        ),
        tabPanel("Ratings critics vs users",
                 sidebarLayout(
                     sidebarPanel(
                         "Sidebar"
                     ),
                     mainPanel(
                         "Plots"
                     )
                 )
        ),
        tabPanel("Used dataset",
                 sidebarLayout(
                     sidebarPanel(
                         "Sidebar"
                     ),
                     mainPanel(
                         "Plots"
                     )
                 )
        )
    )
    
) 

# Define server logic required to draw a histogram

