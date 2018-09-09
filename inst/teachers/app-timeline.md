# App and Tutorial Schedule

This doc sets out a rough timeline for when to do which app or tutorial.

## Chapter 1

Nothing

## Chapter 2: Summarizing Data

* After slide *scatter plots*, do `runTutorial('chapter2')`.
    - Discrete Data
    - Continuous Data
    - Estimation based on a sample
* Immediately after, `runTutorial('correlation')`
* Finally in that chapter, I would recommend to go through the *entire* worked example in the book at 2.4.1 "Reading .csv data in the tidy way"

## Chapter 3: Linear Regression

This is by far the most important chapter, so we have a lot of apps. You should take as long for this chapter as you feel is necessary. It's the core of the course.
* After you showed figure 3.1 *but before you mention the term SSR*, `launchApp('reg_simple')`. explanation for the squares comes later, at this stage this is just intuition. 
* continue in 3.1.2 to introduce SSR
* after this point, they **must** have the simple formula (3.1) and what each part means in their head for the rest of their lives. make sure that is the case.
* go back to `launchApp('reg_simple')` and explain the squares
* now `launchApp('SSR_cone')` and tell them that OLS solves exactly this minization problem. spend good time there, explain all the numbers that are visible and that they can drag the 3D graph with their mouse to see better.
* now do `launchApp('reg_full')`. explain
    - there are 10 different examples
    - what happens when you increase the noise level?
    - you should spend a lot of time with this app.
* Now we have the basics down. Next we talk about some simple restrictions on the basic model.
    * what happens if we demean both x and y? `launchApp('demeaned_reg')`
    * contrained regression: what if we have only an intercept, or only a slope? how does our result improve (with 0 intercept, say), if we then demean the data? `launchApp('reg_constrained')`
    * what happens if we rescale either x or y or both by some number? say, what if instead of measuring wage in a regression in euros, we now measure it in 1000s of euros? 
        1. `runTutorial('rescaling')`
        1. `launchApp('rescale')`
* go back to 3.1.3 in the book and define the simple formulae for both coefficients
* 3.1.4
    - `launchApp('anscombe')`
    - `launchApp('datasaurus')`
* Work through book 3.3 example till the end

## Chapter 4: Standard Errors

* `launchApp('sampling')`
* `launchApp('standard_errors_simple')`
* `launchApp('standard_errors_changeN')`
* `launchApp('confidence_intervals')`
* `runTutorial('non_normal')`

## Chapter 5: Multiple Regression

* `launchApp('reg_multivariate')`
* `runTutorial('lm_example')`
* `launchApp('multicollinearity')`


## Chapter 6: Categorical Variables

* `launchApp('reg_dummy')`
* `launchApp('reg_dummy_example')`


