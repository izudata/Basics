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

df %>% 
  select (orderid, orderdate, shipcountry) %>% 
  filter(shipcountry %in% c("Brazil", "France", "USA")) %>% 
  arrange(shipcountry) %>%
  view()


df %>% 
  select(orderid, orderdate, shipcountry) %>% 
  filter(shipcountry %in% c("Brazil", "France", "USA")) %>% 
  arrange(desc(orderdate)) %>% 
  #arrange(orderdate) %>%  # Change 'orderdate' to the column you want to sort by
  view()

dbGetQuery(con, 'select COUNT (DISTINCT orderid) AS countorderid FROM [TSQLV4].[Sales].[Orders]')

dbGetQuery(con, 'select orderid, shipcountry FROM [TSQLV4].[Sales].[Orders]')

result <- dbGetQuery(con, 'SELECT orderid, shipcountry 
                           FROM [TSQLV4].[Sales].[Orders] 
                           WHERE shipcountry = \'Brazil\';')
result


head(df, n = 10)

nrow(df)

df %>% 
  filter (shipcountry == "Brazil") %>% 
  select(orderid, orderdate, shipcountry)


df %>% 
  filter(shipcountry %in% c("Brazil", "USA", "France")) %>% 
  select(orderid, orderdate, shipcountry)

customers <- dbGetQuery(con, "SELECT * FROM [TSQLV4].[Sales].[Customers]")

customers %>% 
  filter(custid == 1) %>% 
  inner_join(df) %>% 
  collect()
  
