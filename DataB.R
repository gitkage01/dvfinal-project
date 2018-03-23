dfB <- eventReactive(c(input$selectCountry), { 
  project <- "https://data.world/diana-luong/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select revenue, quantity, gross_margin, retailer_country, product_line
    from project3dataset
    where retailer_country in (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ")
  paramQuery$params <- c(input$selectCountry[1], input$selectCountry[2], input$selectCountry[3], input$selectCountry[4], input$selectCountry[5], input$selectCountry[6], input$selectCountry[7], input$selectCountry[8], input$selectCountry[9], input$selectCountry[10], input$selectCountry[11], input$selectCountry[12], input$selectCountry[13], input$selectCountry[14], input$selectCountry[15], input$selectCountry[16], input$selectCountry[17], input$selectCountry[18], input$selectCountry[19], input$selectCountry[20], input$selectCountry[21])
  data.world::query(paramQuery, dataset = project)
})

dfB1 <- eventReactive(c(input$selectCountry, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfB() %>% dplyr::filter(between(revenue, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfB()
  }
})
