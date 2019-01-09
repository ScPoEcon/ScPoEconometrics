# Meta Info For Teachers

This document contains info for teachers (at SciencesPo and elsewhere) who want to teach this course.

## Content

1. [Outline and Philosphie](#outline-and-philosphie)
2. [Details](#details)
3. [TODO list teachers](#TODO-list-teachers)
4. [Student/Teacher feedback from first iteration of course](#student-and-teacher-feedback)

## Outline and Philosophie

* This is an introductory course to econometrics taught to 2nd year students at SciencesPo
* The course is mandatory for the Economics and Society major.
* Based on our experience teaching this course for many years, the traditional setup of teaching econometrics was found to be unsuitable. 
	* The traditional curriculum assumes some basic maths knowledge, summation notation for example, as well as some basic statistics.
		* Both maths and stats are taught in the first year.
		* It seems that for many students this is too abstract (or not interesting).
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
* Grades: Some weighted average between a final exam and bi-weekly online quizzes.
* Exams
    - Both Exams and online quizzes rely on the amazing [R-exams](http://www.r-exams.org) package.
    - We produce a pool of template questions, and the package generates random numbers to populate the questions with. Cheating becomes very hard.
	* The package produces solutions and scannable pdfs for automatic grading.
    * One final exam.
    * can produce a mock exam before
    * pen and paper. could allow to use computer for computing during exam, but it carries high risk of cheating or technical problems.
    * Each teacher should supply as many exam questions as possible. We need a question bank from which to choose. 
	    * More on this below in see [TODO](#todo-list-teachers).
* Online Quizzes (Homework)
    - Part of the grade.
    * weekly or bi-weekly
    * Serve the purpose to make sure that they read the book
    * [automatically put on moodle](https://moodle.sciences-po.fr/mod/quiz/view.php?id=114720)
    * Can be automatically generated from our questions pool.
    * We used moodle, but this works for pretty much all other online learning platforms.
* Kahoots
    - Not part of the grade.
	* Kahoot! is an online quiz platform widely used in teaching
	* Kahoots should be given to students in class, just to have some fun and check they understand what is going on. They are played on a mobile phone or a browser. Students choose nicknames. best (fastest and correct) answer wins, shows podium in the end.
	* quick demo:
		* Students need to be able to see your screen.
    	* I (or you!) create intermediate quizzes before class at https://create.kahoot.it/
    	* In class, you launch a kahoot from *my kahoots* (click on *play*).
    	* students go to https://kahoot.it and enter quiz pin
    * teachers should sign up and I can share my kahoots with them. see [TODO](#todo-list-teachers)
    * Here is the [kahoot for chapter 2](https://play.kahoot.it/#/k/9dfe2cc0-ea38-491a-9e0b-fb55867fcdda)
* Communication
    * slack: this is a chatroom-like environment that I have tested successfully in my other courses. 
    	* every group gets their separate channel
    	* every teacher is responsible to manage questions in their group’s channel
    	* general questions should be asked in the #general channel
    	* using this technology is a viable way for me to maintain a global view of how this course is going in the various locations. If I can see what you and your students are talking about, we can react fast to adapt the course. On the other hand, if I have to read through several threaded emails back and forth between you and your students before I can understand what the problem is, this will be much harder (read: *impossible*) to do.
    * I **strongly recommend** to communicate with your students via slack, not via email.
    	* When working with software and computers, there is **ALWAYS** another student who as exactly the same problem as the one you are currently emailing to. The economies of scale are almost unlimited in this domain.
        * You can for once share `code` in a readable way. 
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
	2. You will be associated to the [private exams repo](https://github.com/floswald/ScPoMetricsExams) as soon as you send me your github user name (Point 2. above!). External teachers, please send me an email with that request.
	3. I would like to get at the *very least* 4 questions from each teacher. They can be a mixture of short an long questions. 
8. Have a close look at [the textbook](https://scpoecon.github.io/ScPoEconometrics/). If you have any suggestions about anything at all please [file an issue](https://github.com/ScPoEcon/ScPoEconometrics/issues).
9. Sign for a free account at [https://kahoot.com/](https://kahoot.com/) to we can share short quizzes.
10. Please be vocal. This course is an experiment and we are sailing uncharted territory. Every comment you have will be valuable for us. So [file an issue](https://github.com/ScPoEcon/ScPoEconometrics/issues), post a message on slack, or get in touch otherwise with anything at all!
11. Thank you for participating!

## Student and Teacher Feedback

### Course Iteration 1: September 2018. ScPo Paris and Regional Campuses.

#### Teachers half-term feedback:

##### T1

- Few problems at the beginning concerning the installation of packages: many people had to change their security options in order to install the packages. Now everything is working smoothly.
- Few people had problems opening the slides using safari and google chrome.
- I think that some of the students would like to see more “real world” examples (as the one on California student test scores).
- Two exchange students seem to have troubles understanding basic math concepts (one of them was not able to understand a simple linear equation).
- 10 to 15 students reported some issue with the quiz.
- They seem to like the format of the course.

##### T2

- Installations of R, RStudio, and packages were ok at the end of the first course
- I do not use the slides, I follow the book, projecting RStudio from my laptop
- Student do not use Slack but ask their questions during the course
- (personal opinion) the tidyverse framework arrive too early to understand its interest
- No problem with the quizz (we've tested only the first)

##### T3

-no specific problems with the package. Sometimes students using Macs  have more difficulities because they need to adapt certain lines of code concerning import of files (folder paths etc..)
- students are sometimes surprised that certain functions can use only  particular types of objects as arguments. 
- several student had to retake the test twice because of the  server collapse m. Overall, the results are good, low grades are rare.

Overall, nothing very peculiar or worrisome so far in my groups


##### T4

1. The main problem concerns the ScPoEconometrics package. Sometimes it blocks suddently while it worked 1 day ago. Otherwise, everything goes well.
2. Some students find that the book is hard to follow. Aside from the slides, I give them a synthesis of the R codes at the end of each chapter.
3. Students would like to know the weight of the moodle quizzes.

##### T5

1. Some students had problem when they update the package and run tutorial, fortunately it seems to be ok in the last session. More students had problems with the first test but the second one until now only one student has. Students in my groups rarely interact in Slack, some even never check the messages.
2. Agree that the tidyverse seem to be technical and students were not quite interested in this early stage.
3. The average of the quizzes is good.
4. I think the command should be kept simple since it’s hard for some students even to replicate the command.


##### T6

1. Some student had problem with package installation at the beginning, they seem to know how to interact with slack but don’t really use it.
2. Agree with the past comments about tidyverse, it’s too early for them to understand its interest. They seem to like real world examples. I think that having a kind of small applied project would be helpful as it seems that they just try to reproduce class results and not to play with R. I have 1 student with almost no math background. I think the slides on OLS transformations (normalization, demeaning) may be too cryptic at this stage.
3. 3-4 students had problems with the quiz. The average grade is very nice for now.

##### My response to teacher feedback

So my experience was overall similar to what you are writing, just to reassure you. Going forward, i.e. for the next edition of the course, I take the following messages out of what you wrote:

1. no tidyverse, or only later
2. more real world examples a la `Caschool`and or an applied project
3. Slides on OLS transformation too much math
4. Some find book hard to follow.

All of those are good points. Let me just put some more realism into each point by highlighting that nothing comes for free. Again, this is mainly for my own future benefit, but please feel free to discuss.

1. The Tidyverse approach to cleaning data is easier than the corresponding solution using base R. This is related to *real world*. the example with reading an excel dataset downloaded from the web is _very_ real world in this sense. You will always have to reshape the data somehow, and I am doubtful whether the base R route is simpler to understand.
2. Can produce more worked examples or projects. We did as much as we could with the tutorials so far, clearly the more the better.
3. I explicitly say that the math is only for whoever is interested on those particular slides. I think we should at least give the option for those interested to get a chance to see how stuff works. Debatable.
4. I need more info as to which parts of the book they find hard to follow. Please don’t say *all of it*.

#### Student Feedback

* At the time of writing, the official course evaluation on behalf of students has not yet been published. To be added here.
* I got some informal feedback during the semester.

1. some moodle/exam questions are not suitable for exams. for example, the question about a distribution being left/right skewed or unimodal etc is not always unambiguously clear, givne the random nature of the data.
2. the crashing moodle server caused some real pain. giving people grades under conditions of such technical frailty was quite borderline and I was tempted not to use the moodle quizzes in the grades at all.
3. The federated structure of SciencesPo (central paris and regional campuses) caused some frustration. It is hard to synchronize classrooms at a distance. Some people didn't find slack helpful. 
4. Students who performed poorly on the final exam thought it was too hard/unfair. Students who performed well thought it was not unfair. Not much to learn from this. 80% of exam questions were using the *identical* template previously used in one of the online quizzes.

