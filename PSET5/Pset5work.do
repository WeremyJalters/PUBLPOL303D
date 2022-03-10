/* 1. Report the difference in means in the outcome, re78, for the treatment and control
group, and a 95% confidence interval for the population difference. */


*load data
use "/Users/jeremywalters/Documents/GitHub/PUBLPOL303D/PSET5/lalonde_cps_clean.dta"

ttest re78, by(t) unequal

/* 2. Is this difference a credible estimate of the average treatment effect?

This isn't really credible because we don't have a clear way of isolating the 
effect of the treatment.
*/ 

/*3. Read in the data and test for each of the ten exogenous covariates / pretreatment
variables (age educ black hispanic nodegree married re74 u74 re75 u75) whether their
means differ between the treatment and the control group. In the light of these results,
revisit the question in (2). */

ttest age, by(t) unequal
ttest educ, by(t) unequal
ttest black, by(t) unequal
ttest hispanic, by(t) unequal 
ttest nodegree, by(t) unequal
ttest married, by(t) unequal 
ttest re74, by(t) unequal 
ttest u74, by(t) unequal
ttest re75, by(t) unequal
ttest u75, by(t) unequal


/* The results of these ttests show that there are a number of sigfnificant
differnces between the populations of the test and treatment groups. */ 



/* Problem 4
Use a regression analysis to estimate the average effect of the program
*/

reg re78 t age educ married black hispanic nodegree re74 u74 re75 u75

/* My impression here is that the results of the t-tests shows that there were
differences between the treatment and control groups with these variables, and
to account for them in the regression in what's requires to get a clearer sense
of the effect of the treatment. */

/* Problem 5
 Make the analysis more flexible by including interactions between all the 
 variables.
 */
 
reg re78 t age educ married black hispanic nodegree black##nodegree re74 u74 re75 u75


/*
Use a matching estimator to estimate the average effect for the treated.
(code needs adjusting from )
*/

teffects nnmatch (re78 re74 u74 re75 u75) (t), atet


