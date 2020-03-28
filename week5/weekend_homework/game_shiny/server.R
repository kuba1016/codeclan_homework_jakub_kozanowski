server <- function(input, output) {
  
 #Tab 1 Market Overview
  
  #Filtering
  
    
  # Plot one  creating event reactive
  #Filtering
  
   filtered_data <- eventReactive(input$year_button,{
     games_sales_added_company %>% 
       filter(year_of_release == input$year)
   })
   # Plot one  creating event reactive
   
   output$plot_1 <- renderPlot({
     filtered_data() %>% 
     group_by(year_of_release) %>% 
       summarise(total_sales = sum(sales)) %>% 
       ggplot() +
       aes(year_of_release,total_sales) +
       geom_line(color = "red",size = 2)+
       labs(
         title = "Change in Sales by Year",
         x = "Years",
         y = "Total Sales")+ 
       geom_smooth(alpha = 0.1,color = "green") +
       theme_classic()
   })
   
   # PLOT 2  TAB 1
   output$plot_2 <- renderPlot({
     filtered_data() %>% 
       group_by(year_of_release) %>% 
       summarise(number_of_platforms = n_distinct(platform,na.rm = TRUE)) %>% 
       ggplot() +
       aes(year_of_release,number_of_platforms)+
       geom_line(color = "red",size = 2)+
       labs(
         title = "Change in Number of Platforms",
         x = "Years",
         y = "Number of Platforms")+ 
       scale_y_continuous(breaks = c(-3,-2,-1,0:10)) +
       theme_classic()
   })
   
   #PLOT 3 TAB 1
   
   output$plot_3 <-  renderPlot({
     filtered_data() %>% 
       group_by(year_of_release) %>% 
       mutate(number_of_games = n_distinct(name,na.rm = TRUE)) %>% 
       ggplot() +
       aes(year_of_release,number_of_games,fill = genre) +
       geom_col() +
       theme_classic()+
       scale_fill_brewer(palette = "Set3")
   })
   
   #DATA SUMMARY FiRST TAB
   
   output$data_summary <- renderTable(striped = TRUE,spacing = "xs",{
     filtered_data() %>% 
       group_by(year_of_release) %>% 
       summarise(total_sales = sum(sales),
                 total_companys = n_distinct(company),
                 total_platforms = n_distinct(platform),
                 total_developer = n_distinct(developer),
                 total_new_games = n_distinct(name))
     
   })
        
   #DATA SOURCE LAST TAB 
   output$data <- DT::renderDataTable({
     games_sales_added_company
   })
   
   
        
     
}

