Data types
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
data structures
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
Data frames (setup similar to excel)
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
Importing data into R
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
Data wrangling using R
flower <- read.table('flower.txt', header= TRUE, sep="/t")
flower <- read.table('Final-Project/flower.txt', header = TRUE, sep = "\t")
