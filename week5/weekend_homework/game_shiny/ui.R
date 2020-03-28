library(shiny)
# 
ui <- fluidPage(
    titlePanel(tags$h3("Games Sales 2000 - 2016")),
    tabsetPanel(
        tabPanel("Overview of the market",
                 sidebarLayout(
                     sidebarPanel(
                         tags$br(),
                         sliderInput("year_range",
                                      label = "Year Range", min = min(game_sales$year_of_release), 
                                     max = max(game_sales$year_of_release), value = c(2014, 2016)
                                     )
                         
                     ),
                     mainPanel(
                         plotOutput("sales_overall")
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
                 tags$br(),
                 fluidPage(
                     DT::dataTableOutput("data")
                 )
        )
    )
    
) 

# Define server logic required to draw a histogram

