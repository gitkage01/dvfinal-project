# Change all __3_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__3_ <- downloadHandler(
  filename = function(){"Bar Graph"}, 
  content = function(fname){
    write.csv(dfB1(), fname)
  }
)
output$table__3_ <- renderDataTable({
  DT::datatable(dfB1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Bar__3_ <- renderPlotly({
  plot = dfB1() %>% dplyr::mutate(profit = (revenue/(quantity*gross_margin))) %>%
    ggplot() + geom_bar(mapping = aes(x=retailer_country, y=profit), stat = "identity") +
      
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__3_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__3_), 
      legend.text=element_text(size=input$legendItemSize__3_),
      legend.key = element_rect(size = input$legendKeySize__3_),
      legend.key.size = unit(input$legendKeySize__3_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__3_),
          axis.title=element_text(size=input$textFont__3_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste("Retailer Country and Profit", input$title__3_)) +
    xlab(input$xLabel__3_) + ylab(input$yLabel__3_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__3_)
  
  if( ! is.na(input$plotWidth__3_) & ! is.na(input$plotHeight__3_))
    ggplotly(plot, tooltip = c("revenue"), session="knitr", width = input$plotWidth__3_, height = input$plotHeight__3_)
  else
    ggplotly(plot, tooltip = c("revenue"), session="knitr") 
})
# ---------------------------------------------------------
