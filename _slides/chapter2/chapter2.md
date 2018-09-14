ScPoEconometrics 2
========================================================
author: Florian Oswald
date: 2018-09-14
autosize: true
css: ../style.css

Working With Data
========================================================
incremental: true
class: small-code


* Econometrics is about Data.
* In these slides we will start to look at this.
* Let's first all load a dataset:


```r
data("mpg",package="ggplot2")
```

* how many observations, how many variables?

```r
dim(mpg)
```

```
[1] 234  11
```



The mpg dataset
==============
class: small-code
incremental: true

* And let's look at the first couple of rows:

```r
head(mpg)
```

```
  manufacturer model displ year cyl      trans drv cty hwy fl   class
1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact
```

* `tail` gives you the last rows.
* `names` gives the column names.

The mpg dataset: datatypes
==============
class: small-code
incremental: true

* It's important to know how the data is stored.
* We use `str`:


```r
str(mpg)
```

```
Classes 'tbl_df', 'tbl' and 'data.frame':	234 obs. of  11 variables:
 $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
 $ model       : chr  "a4" "a4" "a4" "a4" ...
 $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
 $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
 $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
 $ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
 $ drv         : chr  "f" "f" "f" "f" ...
 $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
 $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
 $ fl          : chr  "p" "p" "p" "p" ...
 $ class       : chr  "compact" "compact" "compact" "compact" ...
```

Summarizing Data
================
incremental:true

* One can learn only *so much* from looking at the `data.frame`.
* Even if you could *see* all rows of the dataset, you would not know very much **about it**.
* We need to **summarize** the data for us to learn from it.
* In general, we can compute summary statistics, or visualize the data with plots.
* Let's start with some statistics first!
* Let's look at two features: *central tendency* and *spread*.

Central Tendency
================
incremental:true
class: small-code


1. `mean(x)`: the average of all values in `x`.
1. `median`: the value $x_j$ below and above which 50% of the values in `x` lie.


```r
x <- c(1,2,2,2,2,100)
mean(x)
```

```
[1] 18.16667
```

```r
mean(x) == sum(x) / length(x)
```

```
[1] TRUE
```

```r
median(x)
```

```
[1] 2
```

Spread
======
incremental:true
class: small-code


* Another interesting feature is how much a variable is *spread out* about it's center (mean or median).
* The *variance* is such a measure.

```r
var(x)
```

```
[1] 1607.367
```

```r
all.equal(var(x), sum((x - mean(x))^2) / (length(x)-1))
```

```
[1] TRUE
```
* Similarly, the `range` is

```r
range(x)
```

```
[1]   1 100
```


The table function
=================
incremental:true
class: small-code

* `table(x)` is a useful function that counts the occurence of each unique value in `x`:

```r
table(x)
```

```
x
  1   2 100 
  1   4   1 
```

```r
table(mpg$trans)
```

```

  auto(av)   auto(l3)   auto(l4)   auto(l5)   auto(l6)   auto(s4) 
         5          2         83         39          6          3 
  auto(s5)   auto(s6) manual(m5) manual(m6) 
         3         16         58         19 
```

Crosstables
=================
incremental:true
class: small-code

* Given two vectors, `table` produces a contingency table:

```r
table(mpg$trans,mpg$drv)
```

```
            
              4  f  r
  auto(av)    0  5  0
  auto(l3)    0  2  0
  auto(l4)   34 37 12
  auto(l5)   29  8  2
  auto(l6)    2  2  2
  auto(s4)    2  1  0
  auto(s5)    1  2  0
  auto(s6)    7  8  1
  manual(m5) 21 33  4
  manual(m6)  7  8  4
```
* with `prop.table`, we can get proportions:

```r
prop.table(table(mpg$trans,mpg$drv),margin=2)
```


Plotting
========

* `R` base plotting is fairly good.
* There is an extremely powerful alternative in package `ggplot2`. We'll see both.
* A `hist`ogram counts how many obserations fall within a certain bin.

Histogram
===============
class: small-code


```r
hist(mpg$cty)
```

<img src="chapter2-figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" style="display: block; margin: auto;" />

Nicer Histogram
===============
class: small-code


```r
hist(mpg$cty, xlab   = "Miles Per Gallon (City)", main   = "Histogram of MPG (City)", breaks = 12, col = "red",border = "blue")
```

<img src="chapter2-figure/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />


Looking for Outliers: Boxplots
====================
class: small-code

* It's good to know if a variable has *outliers*, i.e. values much more extreme than the mass of all values.
<img src="chapter2-figure/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" style="display: block; margin: auto;" />

Scatter Plots
============
incremental:true
class: small-code

* Two variables $x$ and $y$
* Natural to ask: How often do certain pairs of $(x_i,y_i)$ occur?

```r
head(mpg[,c("hwy","displ")])
```

```
  hwy displ
1  29   1.8
2  29   1.8
3  31   2.0
4  30   2.0
5  26   2.8
6  26   2.8
```
* That's what a scatter plots shows.

Scatter Plots
============
incremental:true
class: small-code


```r
plot(hwy ~ displ, data = mpg)
```

<img src="chapter2-figure/unnamed-chunk-15-1.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" style="display: block; margin: auto;" />

It's Tutorial Time!
====================
type: alert

Time for our first tutorial!! Type this into your `RStudio` console:


```r
library(ScPoEconometrics)
runTutorial('chapter2')
```

How are x and y related? Covariance
==========================


<img src="chapter2-figure/x-y-corr-1.png" title="plot of chunk x-y-corr" alt="plot of chunk x-y-corr" style="display: block; margin: auto;" />

The [relevant section in the book](https://scpoecon.github.io/ScPoEconometrics/sum.html#summarize-two) is **mandatory** reading.

Correlation App
==============


```r
library(ScPoEconometrics)
runTutorial('correlation')
```


The Tidyverse
==========
incremental: true

* [Hadley Wickham](http://hadley.nz)
* What is *tidy* data?
  1. Each variable is a column
  1. Each observation is a row
  1. Each value is a cell.
* That's not always how we get data.
* Some tools first.



tibbles are tidy data.frames
==========================
class: small-code
incremental: true


```r
library(tidyr)  # also loads library(tibble)
data(mpg,package = "ggplot2")  # data from the ggplot2 package
mpg
```

```
# A tibble: 234 x 11
   manufacturer model displ  year   cyl trans drv     cty   hwy fl    cla…
   <chr>        <chr> <dbl> <int> <int> <chr> <chr> <int> <int> <chr> <ch>
 1 audi         a4      1.8  1999     4 auto… f        18    29 p     com…
 2 audi         a4      1.8  1999     4 manu… f        21    29 p     com…
 3 audi         a4      2    2008     4 manu… f        20    31 p     com…
 4 audi         a4      2    2008     4 auto… f        21    30 p     com…
 5 audi         a4      2.8  1999     6 auto… f        16    26 p     com…
 6 audi         a4      2.8  1999     6 manu… f        18    26 p     com…
 7 audi         a4      3.1  2008     6 auto… f        18    27 p     com…
 8 audi         a4 q…   1.8  1999     4 manu… 4        18    26 p     com…
 9 audi         a4 q…   1.8  1999     4 auto… 4        16    25 p     com…
10 audi         a4 q…   2    2008     4 manu… 4        20    28 p     com…
# ... with 224 more rows
```

Subsetting tibbles
=================
incremental:true

* Same as before.


```r
# mpg[row condition, col condition]
mpg[mpg$hwy > 35, c("manufacturer", "model", "year")]
```

```
# A tibble: 6 x 3
  manufacturer model       year
  <chr>        <chr>      <int>
1 honda        civic       2008
2 honda        civic       2008
3 toyota       corolla     2008
4 volkswagen   jetta       1999
5 volkswagen   new beetle  1999
6 volkswagen   new beetle  1999
```

Enter: dplyr
============
class: small-code
incremental:true

* Very powerful package. [Check it out!](https://dplyr.tidyverse.org)


```r
library(dplyr)
mpg %>%    # %>% is the "pipe" operator
  filter(hwy > 35) %>%  # takes output and puts into next function
  select(manufacturer, model, year)
```

```
# A tibble: 6 x 3
  manufacturer model       year
  <chr>        <chr>      <int>
1 honda        civic       2008
2 honda        civic       2008
3 toyota       corolla     2008
4 volkswagen   jetta       1999
5 volkswagen   new beetle  1999
6 volkswagen   new beetle  1999
```


```r
# as such, equivalent to
select(filter(mpg, hwy > 35), manufacturer, model, year)
```


