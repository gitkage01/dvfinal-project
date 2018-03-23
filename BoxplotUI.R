# Change "Boxplot", all __2_s, and edit tiles below:
tabItem(tabName = "Boxplot",
        tabsetPanel( 
          tabPanel("Plot"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__2_'),
                   downloadButton('download__2_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__2_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__2_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__2_", "Title 1", "Boxplot"),
                   numericInput("titleFont__2_", "Title Font", 12)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__2_", "Legend Title", ""),
                   numericInput("legendTitleSize__2_", "Legend Title Size", 10),
                   numericInput("legendItemSize__2_", "Legend Item Size", 10),
                   numericInput("legendKeySize__2_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__2_", "x-Axis Label", "Retailer Country"),
                   textInput("yLabel__2_", "y-Axis Label 1", "Revenue"),
                   numericInput("textFont__2_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__2_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__2_", "yData Maximum (Required)", NA))),
        plotlyOutput("Boxplot__2_", height=800)
)
