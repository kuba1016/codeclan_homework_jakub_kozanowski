library(shiny)
# 
ui <- fluidPage(
    titlePanel(tags$h3("Games Sales 2000 - 2016")),
    tabsetPanel(
        tabPanel("Overview of the market",
                 tags$br(),
                 fluidRow(
                     column(2,
                            checkboxGroupInput("year", label = "Year", 
                                               choices = unique(games_sales_added_company$year_of_release),
                                               selected = c(2000:2016)),
                            actionButton("year_button", label = "Display Plots"),
                            
                    ),
                    column(5,
                           plotOutput("plot_1"),
                           
                           ),
                    column(5,
                           plotOutput("plot_2")
                           )
                 ),
                 tags$br(),
                 fluidRow(
                     tags$br(),
                     column(6,
                            plotOutput("plot_3")
                            
                    ),
                    column(6,
                           
                           tableOutput("data_summary")
                    )
                 )
        ),
        tabPanel("Most profitable games",
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("company",
                                     "Company",
                                     unique(games_sales_added_company$company)
                             
                         )
                     ),
                     mainPanel(
                        plotOutput("tree")
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

