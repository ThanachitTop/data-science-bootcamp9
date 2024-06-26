pizza_menu <- data.frame(
  piz_name = c("Hawaiian", "Seafood", "Spicy Chicken", "Pepperoni"),
  select = c(1, 2, 3, 4),
  size = c("S", "M", "L", "XL"),
  price = c(2, 2, 2, 2)
)

order_piz <- function() {
  total_price <- 0
  total_unit <- 0

  print("Welcome to MYPIZZAS, What do you want?")
  flush.console()

  cus_name <- readline("What is your name, Bro? : ")
  cus_phone <- readline("I want your phone number? : ")
  location <- readline("Where is your address? : ")

  cus_order_add <- 1
  count <- 0
  inputvalues <- list()

  while (cus_order_add != 0 && count <= 10) {
    print(paste("Hi", cus_name))
    print(pizza_menu)
    flush.console()

    cus_order_pizza <- as.numeric(readline("What pizza to order (select number 1 or 2 or 3 or 4): "))
    cus_order_size <- readline("What size pizza, bro? (select size S or M or L or XL): ")
    cus_order_quan <- as.numeric(readline("How many quantity? (1 or 2 or 10): "))

    print(paste("Do you need anything else, Bro", cus_name))
    flush.console()
    cus_order_add <- as.numeric(readline("Do it again (press 1), No more (press 0) : "))
    count = count + 1

    # Show menu
    pizza_name <- pizza_menu$piz_name[cus_order_pizza]
    pizza_size <- cus_order_size
    pizza_quan <- cus_order_quan
    pizza_price <- pizza_menu$price[cus_order_pizza] * pizza_quan

    inputvalues[[count]] <- list(
      Pizza_Name = pizza_name,
      Size = pizza_size,
      Quantity = pizza_quan,
      Price = pizza_price
    )
  }

  print(paste("Mr.", cus_name))
  print("All your orders")
  print(inputvalues)
  print("thank you bro")
}

order_piz()
