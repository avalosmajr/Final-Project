DATA TYPES
Numeric data are numbers that contain a decimal. Actually they can also be whole numbers but we’ll gloss over that.

Integers are whole numbers (those numbers without a decimal point).

Logical data take on the value of either TRUE or FALSE. There’s also another special type of logical called NA to represent missing values.

Character data are used to represent string values. You can think of character strings as something like a word (or multiple words). A special type of character string is a factor, which is a string but with additional attributes (like levels or an order). We’ll cover factors later.
num <- 2.2
class(num)
char <- "hello"
class(char)
logi <- TRUE
class(logi)
is.numeric(num)
is.character(num)
Type	Logical test	Coercing
Character	is.character	as.character
Numeric	is.numeric	as.numeric
Logical	is.logical	as.logical
Factor	is.factor	as.factor
Complex	is.complex	as.complex
Here’s a summary table of some of the logical test and coercion functions available to you.(above)
It can sometimes be useful to be able to change the class of a variable using the as.[className]() family of coercion functions, although you need to be careful when doing this as you might receive some unexpected results (see what happens below when we try to convert a character string to a numeric).

# coerce numeric to character
class(num)
## [1] "numeric"
num_char <-  as.character(num)
num_char
## [1] "2.2"
class(num_char)
## [1] "character"

# coerce character to numeric!
class(char)
## [1] "character"
char_num <- as.numeric(char)
## Warning: NAs introduced by coercion

DATA STRUCTURES
Vectors can contain either numbers, characters, or logicals but not mixtures of these type of data(
There is one important exception to this, you can include NA (remember this is special type of logical) to denote missing data in vectors with other data types
Matrices and arrays
my_mat <-matrix(1:16, nrow = 4, byrow =TRUE)
my_mat
my_array <- array(1:16, dim= c(2, 4, 2))
my_array
rownames(my_mat) <-c("A", "B", "C", "D")
colnames(my_mat) <-c("a", "b", "c", "d")
my_mat
To transpose a matrix use the transposition function (To transpose a matrix, you switch its rows and columns.)
my_mat_t <- t(my_mat)
my_mat_t
To extract the diagonal elements of a matrix and store them as a vector we can use the diag() function.
my_mat_diag <- diag(my_mat)
my_mat_diag
lists 
Whilst vectors and matrices are constrained to contain data of the same type, lists are able to store mixtures of data types.
To create a list we can use the list() function. Note how each of the three list elements are of different classes (character, logical, and numeric) and are of different lengths.
list_1 <- list(c("black", "yellow", "orange"), 
c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
matrix(1:6, nrow=3))
list_1
list_2 <- list(colors = c("black", "yellow", "orange"),
                 evaluation = c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
                 time= matrix(1:6, nrow=3))
list_2
names(list_1) <- c("colors", "evaluation", "time")
names(list_1)
list_1

DATA FRAMES (setup similar to excel)
However, whilst matrices are restricted to containing data all of the same type, data frames can contain a mixture of different types of data.
heights <- c(120, 167, 143, 119, 156)
weights <- c(32, 78, 40, 29, 68)
p.names <- c("gimli", "aragon", "samwise", "gandalf", "frodo")
dataf <- data.frame(height= heights, weight= weights, names= p.names)
dataf
dim(dataf)
str(dataf)
p.names <- c("gimli", "aragon", "samwise", "gandalf", "frodo")
dataf <- data.frame(height= heights, weight= weights, names= p.names)
dataf
dim(dataf)
# str(dataf)p.names <- c("gimli", "aragon", "samwise", "gandalf", "frodo")
# dataf <- data.frame(height= heights, weight= weights, names= p.names)
# dataf
# dim(dataf)
# str(dataf)
Above I commented out that block through ctrl+shift+c
Names were classified as factor not characters in the video (need to use stringsAsFactors = TRUE) so that strings are automatically converted to factors
dataf <- data.frame(height = heights, weight = weights, names = p.names, 
                    stringsAsFactors = TRUE)
str(dataf)

IMPORTING DATA INTO R
flowers <- read.table('data/flowers.txt', header = TRUE, sep = "\t")
header argument tells R the first row of data file contains the variable names
/t argument tells R that the file delimiter is a tab
You will then have a bunch of data in your console you it will be best to use str(flowers)
flowers <- read.table(file = 'data/flower.txt', header = TRUE, sep = "\t",
                      stringsAsFactors = TRUE)
The na.strings = argument allows you to import data where missing values are represented with a symbol other than NA. This can be quite common if you are importing data from other statistical software such as Minitab which represents missing values as a * (na.strings = "*")
na.strings="*"
my_list
If you’re hell bent on directly importing data from other software you will need to install the foreign package which has functions for importing Minitab, SPSS, Stata and SAS files or the xlsx package to import Excel spreadsheets.

Fread function
library(data.table)
all_data <- fread(file = 'data/flower.txt') --- Ask Dr. Dowling which would be better

DATA WRANGLING USING R DATA WRANGLING USING R
flower <- read.table('flower.txt', header= TRUE, sep="/t")
flower <- read.table('Final-Project/flower.txt', header = TRUE, sep = "\t")
flower <- read.table('Final-Project/flower.txt', header = TRUE, sep = "\t")
flower <- read.table('Final-Project/flower.txt')
read.table("Final-Project/flower.txt")
flower <- read.table('Flower_find.txt', header = TRUE, sep = "\t")
flower
When you want to open a file look at the current directory to help for example below the console is R 4.4.2 ~/Downloads/Rstudio/Final-Project/
str(flower)
str(flower)
flower$height (SLIGHTY DIFF NUMBERS THAN IN THE VID ASK DOWLING)
f1 <- flower$height
mean(f1)
summary(f1)
flower[1, 4] #Postionalindex
However, instead of just using a single index, we now need to use two indexes, one to specify the rows and one for the columns. To do this, we can use the notation my_data[rows, columns] where rows and columns are indexes and my_data is the name of the data frame. Again, just like with our vectors our indexes can be positional or the result of a logical test.
flower[1:10, 1:4] #Postionalindex
flower[c(1,5,12,30), c(1,3,6,8)] #Postionalindex
flower[]
flower[1:8] #Postionalindex
flower[1:8,] #Postionalindex
flower[,1:3] #Postionalindex
If you don’t specify either a row or column index in the [ ] then R interprets it to mean you want all rows or all columns
flower[-(1:85), -c(4, 7, 8)] #Postionalindex
Notice we need to use -() when we generate our row positional vectors. If we had just used -1:85 this would actually generate a regular sequence from -1 to 85 which is not what we want (we can of course use -1:-85).
flower[1:5, c("treat", "nitrogen", "leafarea")] #Postionalindex

flower[flower$height > 12,] #logicalindex
flower[flower$nitrogen == "high",] 
flower[flower$nitrogen != "medium", 1:4]
flower[flower$height >=6 & flower$nitrogen == "medium" & flower$treat == "notip",]
flower[flower$height >12.3 | flower$height < 2.2,]
remember, if you don’t include a column index after the comma it means all columns
tipplants <- flower[flower$treat == "tip" & flower$nitrogen == "medium" & flower$block == 2, select = c("treat", "nitrogen", "leafarea"))
tipplants <- select = c("treat", "nitrogen", "leafarea")
tipplants
height_ord <- flower[order(flower$height),]
height_ord
leafarea_order <- flower[order(flower$leafarea, decreasing= TRUE),]
leafarea_order

block_height_ord <- flower[order(flower$block, flower$height),]
block_height_ord
We can even order data frames based on multiple variables. For example, to order the data frame flowers in ascending order of both block and height.

block_revheight_ord <- flower[order(flower$block, -flower$height), ]        
block_revheight_ord
What if we wanted to order flowers by ascending order of block but descending order of height? We can use a simple trick by adding a - symbol before the flowers$height variable when we use the order() function. This will essentially turn all of the height values negative which will result in reversing the order. Note, that this trick will only work with numeric variables.

block_revheight_ord <- flower[order(-xtfrm(flower$nitrogen), flower$height), ]        
block_revheight_ord
If we wanted to do the same thing with a factor (or character) variable like nitrogen we would need to use the function xtfrm() for this variable inside our order() function.
Notice that the nitrogen variable has been reverse ordered alphabetically and height has been ordered by increasing values within each level of nitrogen.

flower$nitrogen <- factor(flower$nitrogen, 
                           levels = c("low", "medium", "high"))    
nit_ord <- flower[order(flower$nitrogen),]
nit_ord
If we wanted to order the data frame by nitrogen but this time order it from low -> medium -> high instead of the default alphabetically (high, low, medium), we need to first change the order of our levels of the nitrogen factor in our data frame using the factor() function. Once we’ve done this we can then use the order() function as usual. Note, if you’re reading the pdf version of this book, the output has been truncated to save space.

Summarising data frames
summary(flower)
summary(flower[,4:7])
summary(flower$leafarea)
summary(flower[,6])
table(flower$nitrogen)
table(flower$nitrogen, flower$treat)
table(flower$nitrogen, flower$treat)
xtabs(~ nitrogen + treat + block, data = flower)
ftable(xtabs(~ nitrogen + treat + block, data = flower))
tapply(flower$height, flower$nitrogen, mean)
A more flexible version of the table() function is the xtabs() function. The xtabs() function uses a formula notation (~) to build contingency tables with the cross-classifying variables separated by a + symbol on the right hand side of the formula. xtabs() also has a useful data = argument so you don’t have to include the data frame name when specifying each variable.
We can even build more complicated contingency tables using more variables. Note, in the example below the xtabs() function has quietly coerced our block variable to a factor.
And for a nicer formatted table we can nest the xtabs() function inside the ftable() function to ‘flatten’ the table.
We can also summarise our data for each level of a factor variable. Let’s say we want to calculate the mean value of height for each of our low, meadium and high levels of nitrogen. To do this we will use the mean() function and apply this to the height variable for each level of nitrogen using the tapply() function.
The tapply() function is not just restricted to calculating mean values, you can use it to apply many of the functions that come with R or even functions you’ve written yourself (see Chapter 7 for more details). For example, we can apply the sd() function to calculate the standard deviation for each level of nitrogen or even the summary() function.
tapply(flower$height, flower$nitrogen, sd)
tapply(flower$height, flower$nitrogen, summary)






