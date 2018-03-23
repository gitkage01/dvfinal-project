# Change all __4_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__4_ <- downloadHandler(
  filename = function(){"Scatterplot.csv"}, 
  content = function(fname){
    write.csv(dfB1(), fname)
  }
)
output$table__4_ <- renderDataTable({
  DT::datatable(dfB1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Scatterplot__4_ <- renderPlotly({
  plot = dfB1() %>% mutate(profit_percent = cume_dist((revenue/(quantity*gross_margin)))) %>%
    filter(retailer_country == "United States", profit_percent >= 0.80) %>%
    ggplot() + geom_point(mapping = aes(x=quantity, y=revenue, colour=product_line)) +
    geom_smooth(aes(x=quantity, y=revenue, colour=product_line), method=lm, formula=y~x, se=TRUE) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__4_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__4_), 
      legend.text=element_text(size=input$legendItemSize__4_),
      legend.key = element_rect(size = input$legendKeySize__4_),
      legend.key.size = unit(input$legendKeySize__4_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__4_),
          axis.title=element_text(size=input$textFont__4_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste("Revenue and Quantity", input$title__4_)) +
    xlab(input$xLabel__4_) + ylab(input$yLabel__4_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__4_)
  
  if( ! is.na(input$plotWidth__4_) & ! is.na(input$plotHeight__4_))
    ggplotly(plot, tooltip = c("revenue"), session="knitr", width = input$plotWidth__4_, height = input$plotHeight__4_)
  else
    ggplotly(plot, tooltip = c("revenue"), session="knitr") 
})
# ---------------------------------------------------------
