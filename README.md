# ScPo UG Econometrics

[![Build Status](https://travis-ci.org/ScPoEcon/ScPoEconometrics.svg?branch=master)](https://travis-ci.org/ScPoEcon/ScPoEconometrics)

[![Gitter Chat](http://badges.gitter.im/ScPoEcon/ScPoEconometrics.svg)](https://gitter.im/ScPoEconometrics/Lobby)

This is the git repo for the UG Econometrics book taught to 2nd year students at SciencesPo.

## Tutorials

In order to run the accompanying tutorials, you must install this repository as an R package into your computer. Do this:

```R
library(devtools)
install_github(repo = "floswald/ScPoEconometrics")
```

Then you can run the respective tutorial for the corresponding chapter, by typing, for example:

```R
install.packages("learnr")  # install only once
library(learnr)
run_tutorial("chapter3",package="ScPoEconometrics")
```

## Contribution Workflow

1. fork this repository
1. clone your fork to your computer: `git clone url_or_your_fork`
1. Start to work on your things on a new branch: `git checkout -b new_branch`
1. **commit** your work to that new branch! 
1. Place your new stuff on top of the most recent `upstream/master`:
	1. add the upstream repo as a remote: `git remote add upstream git@github.com:floswald/ScPoEconometrics.git`
	1. Use the `rebase` command
    ```
    # git add your stuff
    # git commit your stuff
    git fetch upstream   # get stuff from upstream
    git rebase upstream/master  # merge upstream master and put your commits on top of it
    ```
1. push that branch to your fork: `git push origin new_branch`
1. create pull request on `upstream`


## Technology

this book is made using bookdown.
You can find the preview of an example at https://bookdown.org/yihui/bookdown-demo/


## License

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/)
![](images/cc.png)

You are free to:

* Share — copy and redistribute the material in any medium or format
* Adapt — remix, transform, and build upon the material

Under the following **terms**:

1. Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
2. NonCommercial — You may not use the material for commercial purposes.
3. ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

### Attributions

Under the CC licence above, we are obliged to attribute any material that this book uses and which was shared under the same license:

1. Chapter 2 *Introduction to R* is copied almost entirely from [appliedstats](https://daviddalpiaz.github.io/appliedstats/) by [David Dalpiaz](https://daviddalpiaz.com). I added a couple of practical tasks and made some minor edits. 
1. Chapter 3 is partly based on [appliedstats](https://daviddalpiaz.github.io/appliedstats/), but only up to *scatterplots*.
