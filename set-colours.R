library(tidyverse)

gray1 <- "#323232" #off black
gray2 <- "#8C8C8C" #dark gray
gray3 <- "#ECECEC" #light gray

purple <- "#6F0791" #main colour

purple1 <- "#9E42FF"
purple2 <- "#AE62FF"
purple3 <- "#BD81FF"

rubine1 <- "#CF3C5E"
rubine2 <- "#CF657E"
rubine3 <- "#CF8F9C"

green1 <- "#63CF3C"
green2 <- "#82CF65"
green3 <- "#A0CF8F"

red1 <- "#CF3C3C"
red2 <- "#CF6565"
red3 <- "#CF8F8F"

gold1 <- "#CFB93C"
gold2 <- "#CFBF65"
gold3 <- "#CFC58F"

aqua1 <- "#3CCFC3"
aqua2 <- "#65CFC6"
aqua3 <- "#8FCFCA"

beige1 <- "#CF883C"
beige2 <- "#CF9C65"
beige3 <- "#CFB08F"

blue1 <- "#3C91CF"
blue2 <- "#65A3CF"
blue3 <- "#8FB4CF"

indigo1 <- "#3C55CF"
indigo2 <- "#6577CF"
indigo3 <- "#8F90CF"

mint1 <- "#3CCF86"
mint2 <- "#65CF9A"
mint3 <- "#8FCFAF"



#All colours

fastmarkets_pal <- c(gray1,gray2,gray3,purple,
                     purple1,purple2,purple3,rubine1,rubine2,rubine3,green1,green2,green3,red1,red2,red3,gold1,gold2,gold3,
                     aqua1,aqua2,aqua3,beige1,beige2,beige3,blue1,blue2,blue3,indigo1,indigo2,indigo3,mint1,mint2,mint3)

length(fastmarkets_pal) #34

length(unique(fastmarkets_pal)) #check

pie(rep(1, length(fastmarkets_pal)), col = fastmarkets_pal) #visual


#Dark colours
fastmarkets_pal_dark <- c(gray1,gray2,purple,purple1,rubine1,green1,red1,gold1,aqua1,beige1,blue1,indigo1,mint1)
length(fastmarkets_pal_dark) #13
pie(rep(1, length(fastmarkets_pal_dark)), col = fastmarkets_pal_dark)


#Middle colours
fastmarkets_pal_mid <- c(purple2,rubine2,green2,red2,gold2,aqua2,beige2,blue2,indigo2,mint2)
length(fastmarkets_pal_mid) #10
pie(rep(1, length(fastmarkets_pal_mid)), col = fastmarkets_pal_mid)


#Light colours
fastmarkets_pal_light <- c(purple3,rubine3,green3,red3,gold3,aqua3,beige3,blue3,indigo3,mint3)
length(fastmarkets_pal_light) #10
pie(rep(1, length(fastmarkets_pal_light)), col = fastmarkets_pal_light)



#Per colour
gray <- c(gray1,gray2,gray3)
purple <-c(purple,purple1,purple2,purple3)
rubine <- c(rubine1,rubine2,rubine3)
green <- c(green1,green2,green3)
red <- c(red1,red2,red3)
gold <- c(gold1,gold2,gold3)
aqua <- c(aqua1,aqua2,aqua3)
beige <- c(beige1,beige2,beige3)
blue <- c(blue1,blue2,blue3)
indigo <- c(indigo1,indigo2,indigo3)
mint <- c(mint1,mint2,mint3)
