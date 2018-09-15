ScPoEconometrics 3
========================================================
author: Florian Oswald
date: 2018-09-15
autosize: true
css: ../style.css

Data On Cars
============

* Suppose we had data on car `speed` and stopping `dist` (ance):


```r
head(cars)
```

```
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10
```

* How are `speed` and `dist` related?

Scatterplot of Cars
===================
incremental:true

<img src="chapter3-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

* What's a reasonable **summary** of this relationship?

A Line throught the Scatterplot of Cars
===================
incremental:true

<img src="chapter3-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

* *A line*. Great. But **which** line? This one?
* That's a *flat* line. But `dist` is increasing. :-(


A Line throught the Scatterplot of Cars
===================
incremental:true

<img src="chapter3-figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

* **That** one?
* Slightly better. Has a *slope* and an *intercept*.

The Best Line
======================





<img src="chapter3-figure/line-arrows-1.png" title="The best line and its errors" alt="The best line and its errors" style="display: block; margin: auto;" />

* Red Arrows are *errors* or *residuals* (often $\varepsilon$ or $u$)


Writing Down A Line
=============
incremental:true

* We observe $(y_i,x_i)$ in the data.
* Here is a formula that describes their relationship:
$$
y_i = \beta_0 + \beta_1 x_i + \varepsilon_i
$$
* How to choose $\beta_0$ and $\beta_1$ s.t. this is **best** line?

App Time!
=========


```r
library(ScPoEconometrics)
launchApp('reg_simple_arrows')
```

Writing Down The Best Line
=============
incremental:true

* choose $(\beta_0,\beta_1)$ s.t. the sum $\varepsilon_1^2 + \dots + \varepsilon_N^2$ is **as small as possible**
* $\varepsilon_1^2 + \dots + \varepsilon_N^2$ is the *sum of squared residuals*, or SSR.
* Wait a moment... Why *squared* residuals?!

Minimizing Squared Residuals
=============
incremental:true

* In previous plot, errors of different sign ($+/-$) cancel out!
* The line with minimal SSR need not be a *very good* summary of our data.
* Squaring each $\varepsilon_i$ solves that issue as $\varepsilon_i \geq 0, \forall i$

Best Line and Squared Errors
=============
incremental:true

<img src="chapter3-figure/line-squares-1.png" title="plot of chunk line-squares" alt="plot of chunk line-squares" style="display: block; margin: auto;" />

App Time!
=========


```r
library(ScPoEconometrics)
launchApp('reg_simple')
```

Formulae For OLS
=================
incremental:true

