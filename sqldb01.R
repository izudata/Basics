dbListTables(con)
fields <- dbListFields(con, "Sales.Orders")
print(fields)

dbListFields(con, "Sales.Orders")

df <- dbGetQuery(con,"SELECT * FROM [TSQLV4].[Sales].[Orders]")
df

df_selected <- df %>% 
  select(orderid, custid)
view(df_selected)




df %>% 
  #select(orderid, orderdate, shipcountry) %>% 
  filter(shipcountry %in% c("USA", "France")) %>% 
  count(shipcountry)  # Count occurrences of each shipcountry

df %>% 
  select(orderid, orderdate, shipcountry) %>% 
  filter(shipcountry %in% c("USA", "France")) %>% 
  {table(.$shipcountry)}  # Using curly braces to pass the data frame to table()


df %>% 
  select(orderid, orderdate, shipcountry) %>% 
  filter(shipcountry %in% c("USA", "France")) %>% 
  summary()  

df %>% 
  select(orderid, orderdate, shipcountry) %>% 
  filter(shipcountry %in% c("USA", "France")) %>% 
  view()


df %>% 
  select(orderid, orderdate, shipcountry) %>% 
  filter(shipcountry %in% c("USA", "France", "Brazil")) %>% 
  view()
