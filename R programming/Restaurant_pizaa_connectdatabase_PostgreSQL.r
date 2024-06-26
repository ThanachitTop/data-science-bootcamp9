## install package
install.packages(RPostgreSQL)
install.packages(RSQLite)

## load library
library(RPostgreSQL)
library(RSQLite)

## connect to Postgresql server 
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "xxxxxx",
  user = "xxxxxxx",
  password = "xxxxxxxxxxxxxxxxxxxxxxx",
  port = 5432
)


## create table 
customers <- tribble(
  ~customerid, ~customer_name, ~region, ~dob, ~phone, ~gender,
  "C1", "David", "Pathum", "1997-10-24", "089-111-2222", "male",
  "C2", "Top", "Pathum", "1998-12-30", "089-111-3333", "male",
  "C3", "Benz", "Pathum", "2000-01-29", "089-111-4444", "female",
  "C4", "Moss", "Pathum", "2002-09-01", "089-111-5555", "female",
  "C5", "toyeiei", "Bangkok", "1990-02-03", "089-111-6666", "female",
  "C6", "six", "Bangkok", "1994-05-05", "089-111-7777", "male",
  "C7", "seven", "Nonthaburi", "1998-07-29", "089-111-8888", "male",
  "C8", "eight", "Nonthaburi", "2000-12-09", "089-111-9999", "female",
  "C9", "nine", "Bangkok", "1992-02-05", "089-111-0000", "male"
)
cashiers <- tribble(
  ~cashierid, ~orderid, ~riderid, ~paymentid, ~price,
  "CAS1", "order1", "rider1", "pay1", 1000,
  "CAS2", "order2", "rider1", "pay2", 1700,
  "CAS3", "order3", "rider3", "pay2", 500,
  "CAS4", "order4", "rider2", "pay1", 1000,
  "CAS5", "order5", "rider1", "pay1", 5000,
  "CAS6", "order6", "rider5", "pay2", 2000,
  "CAS7", "order7", "rider4", "pay2", 500,
  "CAS8", "order8", "rider1", "pay2", 2700,
  "CAS9", "order9", "rider4", "pay1", 3200,
  "CAS10", "order10", "rider1", "pay2", 2000,
  "CAS11", "order11", "rider1", "pay1", 2500,
  "CAS12", "order12", "rider2", "pay2", 5000
)
employees <- tribble(
  ~employeeid, ~employee_name,
  "EM1", "man",
  "EM2", "gig",
  "EM3", "tip",
  "EM4", "num"
)
hereorgos <- tribble(
  ~hereorgoid, ~name,
  "HG1", "here",
  "HG2", "togo",
  "HG3", "rider"
)
kitchens <- tribble(
  ~kitchens, ~menuid, ~orderid, ~hereorgoid,
  "K1", "M1", "order1", "HG1",
  "K2", "M1", "order1", "HG1",
  "K3", "M2", "order2", "HG2",
  "K4", "M3", "order2", "HG2",
  "K5", "M1", "order3", "HG3",
  "K6", "M3", "order4", "HG3",
  "K7", "M4", "order5", "HG2",
  "K8", "M4", "order5", "HG2",
  "K9", "M5", "order6", "HG3",
  "K10", "M1", "order7", "HG3",
  "K11", "M2", "order8", "HG1",
  "K12", "M5", "order8", "HG1",
  "K13", "M2", "order9", "HG3",
  "K14", "M1", "order9", "HG3",
  "K15", "M5", "order9", "HG3",
  "K16", "M5", "order10", "HG1",
  "K17", "M4", "order11", "HG2",
  "K18", "M5", "order12", "HG3",
  "K19", "M5", "order12", "HG3",
  "K20", "M3", "order12", "HG3"
)
menus <- tribble(
  ~menuid, ~pizza_name, ~price,
  "M1", "Vegetarian", 500,
  "M2", "Pepperoni", 700,
  "M3", "BBQ", 1000,
  "M4", "Hawaiian", 2500,
  "M5", "Meat Feast", 2000
)
orders <- tribble(
  ~orderid, ~customerid, ~cashierid, ~d, ~employeeid,
  "order1", "C1", "CAS1", "2023-01-20", "EM1",
  "order2", "C2", "CAS2", "2023-02-10", "EM2",
  "order3", "C2", "CAS3", "2023-03-20", "EM3",
  "order4", "C3", "CAS4", "2023-04-05", "EM4",
  "order5", "C5", "CAS5", "2023-05-10", "EM1",
  "order6", "C6", "CAS6", "2023-05-13", "EM2",
  "order7", "C7", "CAS7", "2023-06-24", "EM3",
  "order8", "C8", "CAS8", "2023-07-28", "EM4",
  "order9", "C9", "CAS9", "2023-09-30", "EM1",
  "order10", "C1", "CAS10", "2023-10-01", "EM2",
  "order11", "C6", "CAS11", "2023-12-25", "EM3",
  "order12", "C4", "CAS12", "2023-12-26", "EM4"
)
payments <- tribble(
  ~paymentid, ~payment_name,
  "pay1", "cash",
  "pay2", "bank"
)
riders <- tribble(
  ~riderid, ~rider_name,
  "rider1","hereorgo",
  "rider2","Book",
  "rider3","Max",
  "rider4","tong",
  "rider5","night"
)


## write table 
dbWriteTable(con, "cashiers", cashiers, row.names = FALSE)
dbWriteTable(con, "customers", customers, row.names = FALSE)
dbWriteTable(con, "employees", employees, row.names = FALSE)
dbWriteTable(con, "hereorgos", hereorgos, row.names = FALSE)
dbWriteTable(con, "kitchens", kitchens, row.names = FALSE)
dbWriteTable(con, "menus", menus, row.names = FALSE)
dbWriteTable(con, "orders", orders, row.names = FALSE)
dbWriteTable(con, "payments", payments, row.name = FALSE)
dbWriteTable(con, "riders", riders, row.name = FALSE)


## check data 
dbGetQuery(con, "select * from cashiers")
dbGetQuery(con, "select * from customers")
dbGetQuery(con, "select * from employees")
dbGetQuery(con, "select * from hereorgos")
dbGetQuery(con, "select * from kitchens")
dbGetQuery(con, "select * from menus")
dbGetQuery(con, "select * from orders")
dbGetQuery(con, "select * from payments")
dbGetQuery(con, "select * from riders")


## disconnect 
dbDisconnect(con)
