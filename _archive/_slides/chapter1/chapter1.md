



ScPoEconometrics
========================================================
author: Florian Oswald
date: 2019-07-29
autosize: true
css: ../style.css


Welcome to ScPoEconometrics!
================

![scpo](images/ScPo.jpg)

* This is *not* a course about `R`!
* We want to teach you basic Econometrics, with `R`.
* We don't rely on maths, but pratical experience.

Who Are *We*?
=============================
type: sub-section

![floswald](images/floswald.jpg) ![JMR](images/JMR.jpg) ![vviers](images/vviers.jpg)

* [Florian Oswald](https://floswald.github.io)
* [Jean-Marc Robin](https://sites.google.com/site/jmarcrobin/home)
* [Vincent Viers](https://github.com/vviers)

This Course is ...
========================================================

![](images/WIP.png)

But:
========================================================

<div style="width:100%;height:0;padding-bottom:50%;position:relative;"><iframe src="https://giphy.com/embed/dIxkmtCuuBQuM9Ux1E" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/reaction-mrw-weight-dIxkmtCuuBQuM9Ux1E"></a></p>

Exams and Grades
=========================


* There will be quizzes on Moodle roughly every two weeks.
* There will be a final exam on paper.
* We will do online quizzes on kahoot.com
  * On your smartphones!
  * Really fun.
  * but those will not be part of your grade.

Today
==================

1. Logistics
1. Communication - Slack
1. `R` and `RStudio`

But Right Now:
=====================
type: prompt

![](images/RStudio.png)

Slack:
========================================================
incremental: true

* Let me tell you a bit about Slack first.
* Now let's all open Slack on our computers!

R Glossary Number 1
========================================================

* `R`: a statistical programming language
* `RStudio`: an integrated development environment (IDE) to work with `R`
* *command*: user input (text or numbers) that `R` *understands*.
* *script*: a list of commands collected in a text file, each separated by a new line, to be run one after the other.

Warning
========================================================

![](images/warning.png)

* Those slides are a *subset* of [chapter 1](https://scpoecon.github.io/ScPoEconometrics/R-intro.html)
* You **must read the entire chapter**.

R as a Calculator
========================================================
class: small-code
incremental: true

* Let's do some basic arithmetic first:


```r
4 + 1
```

```
[1] 5
```

```r
8 / 2
```

```
[1] 4
```

* Great! What about this?


```r
log(exp(1))
```

```
[1] 1
```

```r
# by the way: this is a comment! (R disregards it)
```


R as a Calculator 2
========================================================
class: small-code
incremental: true

* We can also do exponents with `^`:


```r
x = 2
x^3
```

```
[1] 8
```

* Square roots


```r
sqrt(2)
```

```
[1] 1.414214
```

* and many logarithmic and trigonometric functions.
* ... What??


=========

![](images/help.png)


Where To Get HELP!
================
incremental: true

* `R` built-in `help`:

```r
?log
?sin
?paste
?lm
help(lm)   # help() is equivalent
??plot  # get all help on keyword "plot"
help(ggplot,package="ggplot2")  # show help from a certain package
```

* Help from Humans!
  * [stackoverflow.com](https://stackoverflow.com) [SO]
  * Your classroom channel on Slack
  * [rstudio forum](https://community.rstudio.com)

HOW to get help?
================
incremental: true

1. Describe what you want to do.
1. Describe what you *expect* your code to do.
1. Describe what you your code *does instead*.
  1. Provide the entire error message.
1. Provide enough code to *reproduce* your error.
  1. You can post post code snippets on slack and SO

Packages
========

* `R` users contribute add-on data and functions as *packages*
* Installing packages is easy!


```r
install.packages("ggplot2")
```

* To *use* the contents of a packge, we must load it from our library:


```r
library(ggplot2)
```


==========
type: prompt

![](images/bond-meme.png)

The ScPoEconometrics Package
============================
incremental:true
class: small-code

* We wrote an `R` package for you.
* It's hosted on github.com
* You can install (and frequently update!) from there:

```r
if (!require("devtools")) install.packages("devtools")
library(devtools)
install_github(repo = "ScPoEcon/ScPoEconometrics")
```

* Did it work?

```r
library(ScPoEconometrics)
packageVersion("ScPoEconometrics")
```

```
[1] '0.2.1'
```


Data Types and Data Structures
========================
incremental:true

- Numeric: `1.0, 2.1`
- Integer: `1L`, `2L`, `42L`
- Logical: `TRUE` and `FALSE`
- Character: `"a"`, `"Statistics"`, `"1 plus 2."`
- Categorical or `factor`

* [You should read more right here!](https://scpoecon.github.io/ScPoEconometrics/R-intro.html#data-types)

Vectors
========================
incremental:true
class: small-code

* What *is* a **vector**?
* The `c` function creates vectors.

```r
c(1, 3, 5, 7, 8, 9)
```

```
[1] 1 3 5 7 8 9
```

* Coercion to unique types:

```r
c(42, "Statistics", TRUE)
```

```
[1] "42"         "Statistics" "TRUE"      
```

* Creating a *Range*

```r
(y = 1:6)
```

```
[1] 1 2 3 4 5 6
```


Vectors from Sequences and Repetitions
=======================
incremental:true
class: small-code

* `seq` creates a sequence `from` `to` in steps of `by`:

```r
seq(from = 1.5, to = 2.1, by = 0.1)
```

```
[1] 1.5 1.6 1.7 1.8 1.9 2.0 2.1
```

* `rep` repeats items:

```r
rep("A", times = 10)
```

```
 [1] "A" "A" "A" "A" "A" "A" "A" "A" "A" "A"
```

* They also work in combination:

```r
c(x, rep(seq(1, 9, 2), 3), c(1, 2, 3), 42, 2:4)
```

```
 [1]  2  1  3  5  7  9  1  3  5  7  9  1  3  5  7  9  1  2  3 42  2  3  4
```

Your Turn!
==========

![](images/alert.png)

Task 1
=======
class: small-code
type: alert

* Create a vector of five ones, i.e.

```
[1] 1 1 1 1 1
```
* Notice that the colon operator `a:b` is just short for *construct a sequence from `a` to `b`*. Create a vector the counts down from 10 to 0, i.e. it looks like

```
 [1] 10  9  8  7  6  5  4  3  2  1  0
```
* Use `rep` to create a vector that looks like this:

```
 [1] 1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3
```
* Find out (using `help()`, google or whatever) how to get the *length* of a vector in `R`!

Indexing or Subsetting a Vector
============
class: small-code
incremental: true

* `R` uses `1` based indexing.
* We use `[]` to get the value at an index

```r
x = c(1, 3, 5, 7, 8, 9)
x[2]
```

```
[1] 3
```
* Works with vectors of indices:

```r
x[c(2,5)]
```

```
[1] 3 8
```
* And can get *all but* indices:

```r
x[-4]
```

```
[1] 1 3 5 8 9
```

Logical Subsetting
================
class: small-code
incremental: true

* One can use a vector of `TRUE` and `FALSE` to index:

```r
x = c(1, 3, 5, 7, 8, 9)
x[c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)]
```

```
[1] 1 3 5 8
```
* Let's create a *logical vector* for condition `x > 3`

```r
x > 3
```

```
[1] FALSE FALSE  TRUE  TRUE  TRUE  TRUE
```
* We can get all values of `x` where `x>3` is `TRUE`:

```r
x[ x > 3 ]
```

```
[1] 5 7 8 9
```


Task 2!
========
class: small-code
type: alert

* From the `runif` function get 10 numbers drawn from the uniform distribution and store in `x`.

* get all the elements of `x` larger than 0.3, and store them in `y`.

* using the function `which`, store the *indices* of all of those elements in `iy`.

```
[1]  1  2  3  4  9 10
```
* Check that `y` and `x[iy]` are identical.

```
[1] TRUE TRUE TRUE TRUE TRUE TRUE
```

Matrix
=======
class: small-code
incremental: true

* A `Matrix` is a two-dimensional Array

```r
X = matrix(1:9, nrow = 3, ncol = 3)
X
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```
* Subsetting needs two indices now:

```r
X[1,2]
```

```
[1] 4
```

```r
X[3, ]
```

```
[1] 3 6 9
```

Matrix Operations
=================
class: small-code
incremental: true

* Let's create two matrices.

```r
X = matrix(1:4, 2, 2)
Y = matrix(4:1, 2, 2)
```
* Arithmetic!

```r
X * Y # equally for +, - and /
```

```
     [,1] [,2]
[1,]    4    6
[2,]    6    4
```
* But `X * Y` is **not** matrix multiplication. All of above are *element by element* operations.
* Matrix multiplication uses `%*%`. What is `X %*% Y` for you?

Task 3
======
type: alert

* Create a vector containing `1,2,3,4,5` called v.

* Create the (2,5) matrix `m`:

```
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    2    3    4    5
[2,]    6    7    8    9   10
```
* Perform matrix multiplication of `m` with `v`. Use the command `%*%`. What dimension does the output have?

```
[1] 2 1
```
* Why does the command `v %*% m` not work?

Lists
======
class: small-code
incremental: true

* Up to now, all containers were *homogeneous*
* `lists` are more flexible:

```r
# works with and without fieldnames
ex_list = list(
  a = c(1, 2, 3, 4),
  b = TRUE,
  c = "Hello!",
  d = diag(2)
)
ex_list
```

```
$a
[1] 1 2 3 4

$b
[1] TRUE

$c
[1] "Hello!"

$d
     [,1] [,2]
[1,]    1    0
[2,]    0    1
```

Indexing Lists
======
class: small-code
incremental: true

* `[]` gets a *sublist*
* `[[]]` gets a list element
* Can index by numerical index or name

```r
ex_list[1]
```

```
$a
[1] 1 2 3 4
```

```r
ex_list[[1]]
```

```
[1] 1 2 3 4
```

```r
ex_list$d
```

```
     [,1] [,2]
[1,]    1    0
[2,]    0    1
```

Task 4
======
type: alert

1. Copy and paste the above code for `ex_list` into your R session. Remember that `list` can hold any kind of `R` object. Like...another list! So, create a new list `new_list` that has two fields: a first field called "this" with string content `"is awesome"`, and a second field called "ex_list" that contains `ex_list`.
1. Accessing members is like in a plain list, just with several layers now. Get the element `c` from `ex_list` in `new_list`!
1. Compose a new string out of the first element in `new_list`, the element under label `this`. Use the function `paste` to print the string `R is awesome` to your screen.


```r
names(new_list)
```

```
[1] "this"    "ex_list"
```

```r
paste("R",new_list$this)
```

```
[1] "R is awesome"
```


DataFrames
==========
incremental: true

* `DataFrames` are like spreadsheets.

```r
example_data = data.frame(x = c(1, 3, 5, 7),
                          y = c(rep("Hello", 3), "Goodbye"),
                          z = sample(c(TRUE,FALSE),size=4,replace=TRUE))
example_data
```

```
  x       y     z
1 1   Hello FALSE
2 3   Hello FALSE
3 5   Hello  TRUE
4 7 Goodbye FALSE
```

DataFrames
==========
class: small-code
incremental: true

* Useful methods for a dataframe:

```r
nrow(example_data)
```

```
[1] 4
```

```r
ncol(example_data)
```

```
[1] 3
```

```r
names(example_data)
```

```
[1] "x" "y" "z"
```

Data on Cars
===========
class: small-code
incremental: true

* The `mtcars` dataset is built-in to `R`.

```r
head(mtcars,n=3)  # show first 3 rows
```

```
               mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4     21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710    22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
```
* To access one of the variables **as a vector**, we use the `$` operator as in `mtcars$mpg`
* Or we use the column name or index: `mtcars[,"mpg"]` or `mtcars[,1]`

Subsetting Data.Frames
===========
class: small-code
incremental: true

* Subsetting is like with matrices, `[,]`

```r
# mpg[row condition, col index]
mtcars[mtcars$mpg > 32, c("cyl", "disp", "wt")]
```

```
               cyl disp    wt
Fiat 128         4 78.7 2.200
Toyota Corolla   4 71.1 1.835
```
* But there is a special function which looks nicer.

```r
subset(mtcars, subset = mpg > 32, select = c("cyl", "disp", "wt")]
```

Task 4
======
type: alert

1. How many observations are there in `mtcars`?
1. How many variables?
1. What is the average value of `mpg`?
1. What is the average value of `mpg` for cars with more than 4 cylinders, i.e. with `cyl>4`?


Basic Programming
==============
type: sub-section

* It's useful for us to review some basics for programming.
* We won't be going very deep here, but it's good for you to know some of this.



Variables
==============

* A variable refers to an *object*.
* Another way to say it is that a variable is a name or a *label* for something:

```r
x = 1
y = "roses"
z = function(x){sqrt(x)}
```
* *local* variables are only defined (and hence visible) within a certain area of your code, called a *scope*
* *global* variables are defined everywhere.
* Try to **avoid global variables**.


Control Flow
===========

* We can influence which *branch* our code executes based on
* Whether we follow one branch or another depends on a `condition`.



```r
if (condition == TRUE) {
  some R code
} else {
  some other R code
}
```

Example if-else
=================



```r
x = 1
y = 3
if (x > y) {  # test if x > y
  # if TRUE
  z = x * y  # assign value to z
  print("x is larger than y")
} else {
  # if FALSE
  z = x + 5 * y  # assign other value to z
  print("x is less than or equal to y")
}
z
```


Loops
=====
class: small-code
incremental: true

* This is an example for a loop:

```r
for (i in 1:5){  # does not have to be 1:5!
  print(i) # loop body: gets executed each time
  # the value of i changes with each iteration
}
```

```
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
```
* We can iterate over things other than numbers:

```r
for (i in c("mangos","bananas","apples")){
  print(paste("I love",i))  # the paste function pastes together strings
}
```

```
[1] "I love mangos"
[1] "I love bananas"
[1] "I love apples"
```


Nested Loops
==========
incremental: true
class: small-code

We often also see *nested* loops, which are just what its name suggests:


```r
for (i in 2:3){
  # first nest: for each i
  for (j in c("mangos","bananas","apples")){
    # second nest: for each j
    print(paste("Can I get",i,j,"please?"))
  }
}
```

```
[1] "Can I get 2 mangos please?"
[1] "Can I get 2 bananas please?"
[1] "Can I get 2 apples please?"
[1] "Can I get 3 mangos please?"
[1] "Can I get 3 bananas please?"
[1] "Can I get 3 apples please?"
```


Functions
=========
incremental: true

* Function `say_hello` tells `R` what to do when it you tell it `say_hello()`.

```r
say_hello <- function(your_name = "Lord Vader"){
  paste("You R most welcome,",your_name)
}
# we call the function by typing it's name with round brackets
say_hello()
```

```
[1] "You R most welcome, Lord Vader"
```
* We specified a default argument, but we don't have to.
* Call the function with your name!

Task 5
=====
type: alert
incremental: true

1. Write a for loop that counts down from 10 to 1, printing the value of the iterator to the screen.
1. Modify that loop to write "i iterations to go" where `i` is the iterator
1. Modify that loop so that each iteration takes roughly one second. You can achieve that by adding the command `Sys.sleep(1)` below the line that prints "i iterations to go".
1. Finally, let's create a function called `ticking_bomb`. it takes no arguments, it's body is the loop you wrote in the preceding question. The only think you should add to the body is a line after the loop finishes, printing "BOOOOM!" with `print("BOOOOM!")`. You can repeatedly redefine the function in the console, and try it out with `ticking_bomb()`.
