# Session 1

Teacher brings a laptop with Slack, R and Rstudio installed. Our package code is installed on the laptop. The laptop is connected to the projector. ScPo provided hardware won't allow either Slack nor the installation of our package, so is not useful.

## Welcome!

* Who am I?
	* name
	* experience (research, teaching, other)
* What this course tries to teach you?
	* We want to teach you the basics of data analysis and Econometrics.
	* We want you to try things out, rather than to be able to proof them formally
	* For those of you very eager to derive formal and more rigorous insights, there will be ample opportunity later on, in a Masters or a Phd
	* Our aim is for *everybody* to understand and to be able a linear regression with `R`.
* This is a brand new course.
	* This means that we quite happy to show you plenty of new things, but you should be aware there are still some rough edges. Please be patient if something does not work as expected - we are here to help!

## Meetings

* We meet once per week
* please bring your laptop each time

## Exam and Grading

* There will be quizzes on Moodle roughly every two weeks.
* There will be a final exam on paper.
* We will do online quizzes on kahoot.com, but those will not be part of your grade.

## Today

* We will talk about some logistical details first. You will need your computer running and connected to the internet, so why not start up now?
* Then we will have a first look at `R`. 

### Communication

* We will talk to each other on Slack.
	* Who is not yet signed up to Slack?
* This is much better to talk about issues with computer code than email
	1. it *looks* nicer than in an email
	2. Slack is like a chatroom, so other people see what you say. Odds are that there are several people who have the same/similar problem like you, so this much more efficient in a chatroom.
* Let me quickly show you Slack. You should open Slack on your computer now as well.
	1. [WAITS for all]
	1. In the left panel you can see all the channels you are subscribed to. You can see I am subscribed to more channels than you are.
	1. You should subscribe to *my* channel, so we can talk about things in this classroom. Just click on `Channels` and start typing my first name. You will see my channel appear, click on it, and finally click *join channel* at the bottom.
	1. This channel is your first reference for any questions you have about the course. 
		1. Let me check that you are all in my channel now
		1. [checks *members* in right panel]
		1. I'll post an example message now in our channel to say hello to you all.
		1. [posts hello message into their channel]
	1. Let me show you now how to nicely format computer code in a slack post. it's easy.
		1. [starts typing x + y = 3 and alerts students to the appearing info just below the text box]
		1. We want this to be formatted like ``code``. So we put this in backticks `` ` ``, like so: `` `x + y = 3` `` [hits enter]
		1. If you want to write multiple lines of code, you could start with three backticks, and create a new line with `shift` and `enter` (`enter` alone sends the message!):
		````
		```
		x = 3
		y = 4
		x + y
		```
		````
	1. you can also attach files by clicking on the plus symbol.
	1. Please don't post in the #general channel, as this is for public announcements for all courses.
	1. Finally, you can send direct messages by clicking on a username, or on *direct messages* in your left panel.

### RStudio

* You all have R and RStudio installed?
	* If not, install now and look on your neighbors screen
* Lets all open RStudio!
	* [make sure you have standard layout, from top left to bottom right source, environment, console, files/plots]
	* open an empty script
	* here is the console (bottom left): write some commands into it
	* show that variables show up in environment if you assign a value (top rigiht)
	* make a base plot (not ggplot) and show where it appears
	* write 2 lines of code in the open script file, execute each line (place cursor on line and hit cmd+enter or click on run)
	* save the script file somewhere by clicking on the save symbol
	* type `help(plot)` in the console and explain help file

### Let's get going with R!

* open https://scpoecon.github.io/ScPoEconometrics/R-intro.html and project to wall
* explain how the **book** works
	* left: TOC
	* menu bar on top:
		* make TOC disappear
		* search for a term
		* choose text type
		* edit this page of the book on github.com (to suggest a change or if you found a mistake)
		* download as pdf or as epub.
		* If you like what you see, on the right you can tweet and post to facebook about this book.
* All the code you see in the book actually works. so please copy and paste from it as much as you can!
* Start at 1.2.1: First Glossary
* Do some basics from 1.3
* Do 1.4
* Do 1.5
* Do 1.7 and install the package!
	* make them load the library and check the version!
* keep going over the chapter:
	* ideally you have your RStudio screen open and type commands as you go along
	* we want them to type as many commands as possible!!!
* go until Task 1:
	* 2 minute break!
	* who is having any trouble with their computers, please come and see me now.
	* then do task 1	
* then keep going

