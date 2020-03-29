library(shiny)
tags$links
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
                                               selected = c(2000:2016),inline = TRUE),
                            tags$br(),
                            actionButton("year_button", label = "Display Plots")   
                    ),
                    column(10,
                           plotOutput("plot_1")
                           
                     )
                ),
                 tags$br(),
                 
                 
                 fluidRow(
                     
                    column(6,
                           plotOutput("plot_3")
                           

                           ),
                    column(6,
                           plotOutput("plot_2")
                           )
                 ),
                 tags$br(),
                
        ),
        tabPanel("Most profitable games",
                 tags$br(),
                 fluidRow(
                     column(3,
                            checkboxGroupInput("year_tab_2", label = "Year", 
                                               choices = unique(games_sales_added_company$year_of_release),
                                               selected = c(2000:2016),inline = TRUE),
                            tags$br(),
                            checkboxGroupInput("company", label = "Company box", 
                                        choices = unique(games_sales_added_company$company), 
                                        selected = 1),
                            actionButton("tab_2_button", label = "Display Plots")   
                     ),
                     column(9,
                            plotOutput("plot_1_tab_2")
                            
                     )
                 ),
                 
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

