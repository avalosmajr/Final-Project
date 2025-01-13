2+2
log(1)
log10(1)
exp(1)
sqrt(4)
4^2
pi
log(10)
val <-log(10)
val
These are objects in r starting from line 8; they help 
chr <- "word"
chr
val
my_obj <- 49
my_obj
my_obj2 <- "R is cool"
my_obj2
my_obj2 <- 1024
my_obj2
my_obj3 <- my_obj + my_obj2
my_obj3
my_obj4 <- 1
my_obj4
my_obj5 <- my_obj + my_obj2 + my_obj3 + my_obj4
my_obj5
Starting here is using functions
log(100)
log(100, base = 10)
?log
Below is creating vectors
heights <- c(120, 167, 143, 119, 156)
heights
mean(heights)
var(heights)
sd(heights)
length(heights) 
lenth is elements or how many
p.names <- c("billy", "milly", "killy", "lilly", "tilly")
p.names
1:10
10:1
seq(from =1, to =5, by= 0.1)
rep(c(1,2,3, times= 3)
rep(c(1, 2, 3,), times= 3)
rep(c(1, 2, 3), times =3)
rep(c(1,2,3), times =3)
rep(c(1, 2, 3), each= 3)
rep(p.names, each =2)
my_vec <- c(2, 3, 4, 3, 5, 9, 9)
my_vec
vec_mean <- (my_vec)
vec_mean
Now it is working with vectors (heights is a vector here)
heights [3]
The square brackets used for the heights vector helps to extract the 3rd element 
heights [c(1, 2, 5)]
The cocatnenate was used to extract more than one element
heights[heights>150]
heights > 150
heights[heights ==119]
heights[heights !=119]
! means not 
heights[heights<120 | heights>150]
heights +10
just added 10 to add the height values
heights
weights <- c(32, 78, 40, 39, 68)
bmi <- weights/(heights/100)^2
bmi
heights[c(1:3)]
the colon used above are including elements 1-3
heights >4
heights [heights>140]
& means and | means or
my_vec <- (c(2, 3, 1, 6, 4, 3, 7))
my_vec
my_vec[4] <- 500
my_vec[4]
my_vec
my_vec[c(6,7)] <- 500
my_vec
my_vec[my_vec <=4] <-1000
my_vec
vec_sort <- my_vec
vec_sort <- sort(vec_sort)
vec_sort
my_vec
vec_sort2 <- sort(my_vec, decreasing = TRUE)
vec_sort2
heights_ord <- order(heights)
heights_ord
names_ord <- p.names[heights_ord]
names_ord
When adding multiplying etc vectors you need to make sure the data sizes are the same because quiet recycling can occur
If we change this argument to na.rm = TRUE when we use the mean() function this will allow us to ignore the NA values when calculating the mean.
mean_temp <- c(NA, 7, 3, 8, 9, NA, 9)
mean_temp
mean(mean_temp)
mean_temp <- mean(mean_temp, na.rm = TRUE)
mean_temp
mean_temp1 <- c(1, 5, 3, 8, 9, NA)
mean_temp1
mean(mean_temp1)
help(mean)
?mean
example(mean)
help.search("mean")
??mean
apropos(mean)
apropos("mean")
dataf
str(dataf)
