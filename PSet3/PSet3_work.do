
** missing labels for #1
drop v1
rename v2 earn
rename v3 prize
rename v4 lagged_earn
rename v5 age
rename v6 male
rename v7 educ
rename v8 tixbot
rename v9 workthen

** #2
gen winner=1
replace winner=0 if prize==0


**3
regress earn prize

/** 4.
 A possible reason why this estimate might not be credible is that
 there's likely a threshold below which you wouldn't be able to quit your
 job. Another factor that might affect one's ability to earn no money after
 winning the lottery is the amount of money they'd made over the years prior
 to winning. It's possible that a person who had already earned a substantial
 amount of money prior to winning would be less likely to continue working
 than someone who had a limited amount of money in prior earnings. Whether or
 not someone was working at the time of winning may also matter: It's possible
 that winning the lottery might make someone without a job much less likely to
 try and get one, whereas a person with a job that they found satisying might
 continue for health benefits or community. **/ 
 
 
 
reg age prize
reg male prize
reg educ prize
reg tixbot prize
reg workthen prize
reg lagg prize

 /** 5. 
 A potential reason why these regressions produce non-zero results is the 
 composition of the sample. If the size of the sample were to increase,
 we should move toward zero values.
 */
 
 /**6. 
 If we're looking  at the effect of winning the lottery on future earnings,
 then it might be useful to eliminate non-winners from the data set.
 