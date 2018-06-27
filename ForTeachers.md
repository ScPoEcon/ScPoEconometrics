
# Meta Info

This document contains info for teachers (at SciencesPo and elsewhere) who want to teach this course.

## Outline and Philosophie

* This is an introductory course to econometrics taught to 2nd year students at SciencesPo
* The course is mandatory for the Economics and Society major.
* Based on our experience teaching this course for many years, the traditional setup of teaching econometrics was found to be unsuitable. 
	* The traditional curriculum assumes some basic maths knowledge, summation notation for example, as well as some basic statistics.
		* Both maths and stats are taught in the first year.
		* It seems that for many students this is too abstract (or not interesting):
	* The distribution of student evaluations was always *bimodal*: some students thought it was great, but didn’t go far enough, and a relatively larger number thought it was much too hard and they didn’t get much out of it.
* This edition of the course uses only minimal maths and statistics
	* We are focusing on the lower mode of the above mentioned student evaluations population.
	* We will use `R` to illustrate key concepts interactively.
	* **Important**: this is not a course *about `R`*, in the sense that our primary goal is not to teach students how to program. (This is a very laudable goal in general, but we are constrained in this sense.) 
	* Our primary goal is for students to understand the basics of linear regression, *using `R`*. They will be exposed to some very basic `R` programming.

## Details

* course structure
    * material: Everything the students need is contained in an [online code repository](https://github.com/ScPoEcon/ScPoEconometrics). In particular, this contains an `R` package with
	    * code that produces interactive `apps`, i.e. small server applications, used for illustration
	    * `tutorials`, which are worked examples that require some student input for completion
	    * code that produces the associated textbook
    * textbook: The textbook is online at [https://scpoecon.github.io/ScPoEconometrics/](https://scpoecon.github.io/ScPoEconometrics/). 
	    * It’s readable online in a browser (also on a mobile device), as an `epub` on an ebook reader, or as a `pdf`. 
	    * It is still work in progress (contributions welcome!). Particularly chapter 1 needs drastic shortening.
    * sessions: standard weekly meetings, 12 times per semester, 2 hours per session. The focus of the meetings will be to work on the tutorials, either alone or in small teams. The teacher will start each session with a short overview of the relevant chapter from the online textbook. The main task of the teacher will be to help students along the way and to break after each 20 min interval (or so) with short quizzes (more below).
    * The book should be for home study, practical exercises are done in class
* Exams
	* We will use an automated exam procedure based on R which produces random exams based on a template. With solutions and scannable pdfs for automatic grading.
    * One final exam
    * can produce a mock exam before
    * pen and paper. could allow to use computer for computing during exam.
    * **TODO** It would be great if each teacher could produce at least 4 exam questions from now until september. We need a question bank from which to choose. 
	    * More on this below in see [TODO](#todo-list-teachers).
* Quizzes
    * weekly or bi-weekly
    * Serve the purpose to make sure that they read the book
    * [automatically put on moodle](https://moodle.sciences-po.fr/mod/quiz/view.php?id=114720)
    * Can be automatically generated from our yet to be populated questions pool
* Kahoots
	* Kahoot! is an online quiz platform widely used in teaching
	* Kahoots should be given to students in class, just to have some fun and check they understand what is going on. They are played on a mobile phone or a browser. Students choose nicknames. best (fastest and correct) answer wins, shows podium in the end.
	* quick demo:
		* Students need to be able to see your screen.
    	* I (or you!) create intermediate quizzes before class at https://create.kahoot.it/
    	* In class, you launch a kahoot from *my kahoots* (click on *play*).
    	* students go to https://kahoot.it and enter quiz pin
    * teachers should sign up and I can share my kahoots with them. see [TODO](#todo-list-teachers)
* Communication
    * slack: this is a chatroom-like environment that I have tested successfully in my other courses. 
    	* every group gets their separate channel
    	* every teacher is responsible to manage questions in their group’s channel
    	* general questions should be asked in the #general channel
    	* using this technology is a viable way for me to maintain a global view of how this course is going in the various locations. If I can see what you and your students are talking about, we can react fast to adapt the course. On the other hand, if I have to read through several threaded emails back and forth between you and your students before I can understand what the problem is, this will be much harder (read: *impossible*) to do.
    * I **strongly recommend** to communicate with your students via slack, not via email.
    	* When working with software and computers, there is **ALWAYS** another student who as exactly the same problem as the one you are currently emailing to. The economies of scale are almost unlimited in this domain.
    * I would prefer if you communicated with me as well on slack. You can send private messages.

## TODO list teachers

To ensure consistency in the department's approach to the *Introduction to Econometrics* curriculum, instructors are strongly encouraged to follow the following guidelines.

1. sign up to slack: send me an email at florian.oswald@sciencespo.fr so I can add you
2. get a free account on github.com
3. have a look at our course [code repository](https://github.com/ScPoEcon/ScPoEconometrics)
	1. In particular, look at the [current list of issues](https://github.com/ScPoEcon/ScPoEconometrics/issues) and file new ones
4. Install `R`
5. Install the `R` package as described on the readme of the [code repository](https://github.com/ScPoEcon/ScPoEconometrics).
6. go through **all** the apps. Instructions always on the same readme.
	1. This is important. 
	2. Please run all apps. If you find any trouble, please [file an issue](https://github.com/ScPoEcon/ScPoEconometrics/issues).
	3. Make sure you understand what each app is supposed to teach. If it’s not clear, [file an issue](https://github.com/ScPoEcon/ScPoEconometrics/issues).
	4. Feel free to suggest other apps! By [filing an issue](https://github.com/ScPoEcon/ScPoEconometrics/issues).
7. Create questions. 
	1. Have a look at the textbook for the level of difficulty you should aim at
	2. You will be associated to the [private exams repo](https://github.com/floswald/ScPoMetricsExams) as soon as you send me your github user name (Point 2. above!)
	3. I would like to get at the *very least* 4 questions from each teacher. They can be a mixture of short an long questions. 
8. Have a close look at [the textbook](https://scpoecon.github.io/ScPoEconometrics/). If you have any suggestions about anything at all please [file an issue](https://github.com/ScPoEcon/ScPoEconometrics/issues).
9. Sign for a free account at [https://kahoot.com/](https://kahoot.com/) to we can share short quizzes.
10. Please be vocal. This course is an experiment and we are sailing uncharted territory. Every comment you have will be valuable for us. So [file an issue](https://github.com/ScPoEcon/ScPoEconometrics/issues), post a message on slack, or get in touch otherwise with anything at all!
11. Thank you for participating!
