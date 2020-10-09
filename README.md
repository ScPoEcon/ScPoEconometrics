# ScPo UG Econometrics

This is the git repo for the UG Econometrics book taught to 2nd year students at SciencesPo.

**Slides for the Intro Course?** If you are looking for the introductory course slides, they are in the [ScPoEconometrics-Slides](https://github.com/ScPoEcon/ScPoEconometrics-Slides) repo.

**Slides for the Advanced Course?** If you are looking for the advanced course slides, they are in the [Advanced-Metrics-Slides](https://github.com/ScPoEcon/Advanced-Metrics-slides) repo.

**Apps and Tutorials?** If you are looking for our apps and tutorials, they are in the [ScPoApps](https://github.com/ScPoEcon/ScPoApps) repo.


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
