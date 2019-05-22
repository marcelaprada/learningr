weight_kilo <- 10
weight_kilo

#VECTOR: Chracter
c("a", "b")
#Numeric
c("1","2")
#Logic
c(TRUE,FALSE)

#data frame
head(iris)
colnames(iris)
str(iris)
summary(iris)

# Exercise ----------------------------------------------------------------

# Object names
Day_One
day_one
false <- FALSE
number_value <- 9
sum_vector <- function(x) sum(x)

# Spacing
x[, 1]
x[, 1]
x[, 1]
mean(x, na.rm = TRUE)
mean(x, na.rm = TRUE)
function(x) {}
function(x) {}
height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x^2 + y^2)
df$z
x <- 1:10

# Indenting
if (y < 0 && debug)
  message("Y is negative")

weight <- 10 * 10 + 2


add_two <- function(x, y) {
  added <- x + y
  return(added)
}

add_two(1,2)
add_two(y = 2, x = 1)

source(here::here("R/package-loading.R"))



# SAVE DATA ---------------------------------------------------------------

write_csv(iris, here::here("data/iris.csv"))
imported_iris <- read_csv(here::here("data/iris.csv"))
glimpse(imported_iris)



