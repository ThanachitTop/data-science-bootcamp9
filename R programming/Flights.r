## install package
install.packages("tidyverse")
install.packages("glue")
install.packages("lubridate")
install.packages("nycflights13")

## load library
library("tidyverse")
library("glue")
library("lubridate")
library("nycflights13")

## 1. which airline most flights 

## join table flights and airlines 
inner_join(flights, airlines, by="carrier")

flights %>%
  group_by(name , carrier) %>%
  summarise( n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

## 2. which airline most or least avg delay  

df1 %>% 
  filter(arr_delay > 0) %>% 
  group_by(name, carrier) %>% 
  summarise(sum_delay = mean(arr_delay)) %>% 
  arrange(sum_delay) %>% 
  head(3)

## สายการบิน US Airways มีค่าเฉลี่ยการล่าช้าของเครื่องน้อยที่สุด

df1 %>% 
  filter(arr_delay > 0) %>% 
  group_by(name, carrier) %>% 
  summarise(sum_delay = mean(arr_delay)) %>% 
  arrange(desc(sum_delay)) %>% 
  head(3)

## สายการบิน SkyWest Airlines มีค่าเฉลี่ยการล่าช้าของเครื่องมากที่สุด

## 3. which airline more avg distance 
df1 %>% 
  group_by(name, carrier) %>% 
  summarise(distance = mean(distance)) %>% 
  arrange(desc(distance)) %>% 
  head(5)


## 4. in 09-2013, How many planes flight each distance, long or near 
flights %>% 
  filter(year == 2013, month == 9) %>% 
  select(distance) %>% 
  group_by(distance) %>% 
  mutate(distance = if_else(distance >= 500, "long", "near")) %>% 
  summarise(n=n())


## 5. which month has most flight to MCO 

flights %>% 
  filter(dest == "MCO") %>% 
  count(month) %>% 
  arrange(desc(n))

** เดือน 3 มากที่สุด โดยแต่ละเดือนใกล้เคียงกัน
