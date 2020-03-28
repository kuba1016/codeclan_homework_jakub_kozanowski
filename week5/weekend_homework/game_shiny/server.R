server <- function(input, output) {
  
  output$sales_overall <- renderPlot({
    games_sales_added_company %>% 
      filter(year_of_release == input$year_range) %>% 
      ggplot() +
      aes(year_of_release,sales, fill = company)+
      geom_col() 
  })
  
  #Output of the dataset - last tab
  output$data <- DT::renderDataTable({
    games_sales_added_company
  })
}

# Run the application 
