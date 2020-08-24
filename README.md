# ScPo UG Econometrics

This is the git repo for the UG Econometrics book taught to 2nd year students at SciencesPo.

**Slides?** If you are looking for the slides, they are in the [ScPoEconometrics-Slides](https://github.com/ScPoEcon/ScPoEconometrics-Slides) repo.
**Apps?** If you are looking for the apps, they are in the [ScPoApps](https://github.com/ScPoEcon/ScPoApps) repo.

## Contents

1. [Status](#status)
2. [Usage and Installation](#usage-and-installation) 
3. [Meta Infos for Teachers](#meta-information-for-teachers)
4. [How to Contribute](#contribution-workflow)
5. [License and Copyright](#license)

## Status

**Tests on MacOS and Linux**: [![Build Status](https://travis-ci.org/ScPoEcon/ScPoEconometrics.svg?branch=master)](https://travis-ci.org/ScPoEcon/ScPoEconometrics)

**Tests on Windows**: [![Build status](https://ci.appveyor.com/api/projects/status/9ctm2rneexsid3t2?svg=true)](https://ci.appveyor.com/project/FlorianOswald/scpoeconometrics)



## Usage and Installation

In order to participate in the course and to use the course material, you need to 

1. install `R`: download for free at [https://www.r-project.org](https://www.r-project.org)
1. install the `RStudio` IDE at [RStudio.com](https://www.rstudio.com/products/rstudio/download/#download)
1. We recommend to use our code **exclusively via `RStudio`**.
1. install our *apps* `R` package in your computer. To do so, just copy and paste those lines into your `RStudio` console:

```R
if (!require(devtools)) {install.packages("devtools"); library(devtools)}
install_github(repo = "ScPoEcon/ScPoApps")
```

### Shiny Apps

A key part of this course are a series of interactive applications (or *apps*) that we developed with the `shiny` framework. You launch the apps from a running `R` session on your computer. The app will run in your web browser. You launch an app like this from `R`:

```R
library(ScPoApps)   # load our library
launchApp('SSR_cone')       # runs the `SSR_cone` app in browser

launchApp()                 # no arg produces an error that shows all available apps
Error: Please run `launchApp()` with a valid app as an argument.
Valid apps are: 'anscombe', 'confidence_intervals', 'corr_continuous', 
'datasaurus', 'reg_constrained', 'reg_dummy', 'reg_dummy_example', 
'reg_full', 'reg_multivariate', 'reg_simple', 'reg_standardized', 
'sampling', 'SSR_cone', 'standard_errors_changeN', 'standard_errors_simple'
```

Here is a screenshot of the `SSR_cone` app:

![SSR_cone](images/SSR_cone.png)

### Tutorials

In order to run the accompanying tutorials you would type, for example:

```R
library(ScPoApps)
runTutorial("chapter3")
```

## Meta Information for Teachers

*This section is only relevant if you want to teach this course.*

All material of this course is open source, and you are free to use it. Please refer to the [license](#license) section below for the precise wording and terms of the agreement. In particular, please stick to the agreement about proper citation of this repository.

There is some relevant material in the [teachers](/teachers) folder. In particular, the `ForTeachers.md` document contains a detailed explanation of the course structure, as well as a section on student feedback from the first iteration of the course. The few other documents in there should be self explanatory.

As outlined in the license section, you are free to use and re-use any parts of the content as you see fit. For instance, you could re-use our slides, and modify them, or publish a different version of our textbook (with proper attribution). However, it could be valuable to integrate your changes/additions to the project. In this case, please read on in the next section about how to make contributions.


## Contribution Workflow - Developers only!

This section is only for people who want to contribute code to this project.

1. fork this repository
1. clone your fork to your computer: `git clone url_of_your_fork`
1. Start to work on your things on a new branch: `git checkout -b new_branch`
1. **commit** your work to that new branch! 
1. Place your new stuff on top of the most recent `upstream/master`:
	1. add the upstream repo as a remote: `git remote add upstream git@github.com:ScPoEcon/ScPoEconometrics.git`
	1. Use the `rebase` command
    ```
    # git add your stuff
    # git commit your stuff
    git fetch upstream   # get stuff from upstream
    git rebase upstream/master  # merge upstream master and put your commits on top of it
    ```
1. push that branch to your fork: `git push origin new_branch`
1. create pull request on `upstream` (from your fork at github.com)


## Technology

The book is made using bookdown.
You can find the preview of an example at https://bookdown.org/yihui/bookdown-demo/


## License

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/)
![](images/cc.png)

You are free to:

* Share — copy and redistribute the material in any medium or format
* Adapt — remix, transform, and build upon the material

**under the following terms**:

1. Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use. We are happy to suggest the following citation if you use our material in your work:

```R
> citation("ScPoEconometrics")

Oswald F, Viers V, Villedieu P, Kennedy G (2020).
Introduction to Econometrics with
R. SciencesPo Department of
Economics, Paris, France. <URL:
https://scpoecon.github.io/ScPoEconometrics/>.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {Introduction to Econometrics with R},
    author = {Florian Oswald and Vincent Viers and Pierre Villedieu and Gustave Kennedi},
    organization = {SciencesPo Department of Economics},
    address = {Paris, France},
    year = {2020},
    url = {https://scpoecon.github.io/ScPoEconometrics/},
  }

```
2. NonCommercial — You may not use the material for commercial purposes.
3. ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

### Attributions

Under the CC licence above, we are obliged to attribute any material that this book uses and which was shared under the same license:

1. Large parts of Chapter 1 *Introduction to R* are copied  [appliedstats](https://daviddalpiaz.github.io/appliedstats/) by [David Dalpiaz](https://daviddalpiaz.com). I added a couple of practical tasks and made some minor edits. 
1. Chapter 2 is partly based on [appliedstats](https://daviddalpiaz.github.io/appliedstats/), but only up to *scatterplots*.
