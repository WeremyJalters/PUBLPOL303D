
** 1. Read in the data
import delimited "/Users/jeremywalters/Downloads/riverside_2021.txt", delimiter(space, collapse) 
rename v2 treatment
rename v3 year1earnings
rename v4 year4earnings
rename v5 highschool
rename v6 female
rename v7 age
rename v8 childrenunder6

** 2. Create histograms for earning variables
histogram year1earnings
histogram year4earnings

** 3. Compare the earnings distribution in year one by high school graduation 
** rate. Is the shape of the distribution the same?
sum year1 if treat == 0
sum year1 if treat == 1
graph box year1, by(high)

* the shape of the distribution isn't the same. The distribution for high school
* graduates is less dense around lower values.


*** 4. Compare high school graduation rates in treatment and control groups
mean high if treatment ==1
mean high if treatment ==0

** 5. Test the null hypothesis that there is no effect of the training program 
** on earnings a year after the program
ttest year1, by(treatment)

** 6. Estimate Average Treatment Effect
ttest year1, by(treatment)

** 7.
ttest year4, by(treatment)

** 8. 
ttest year1earnings if highschool==1, by(treatment)
ttest year1earnings if highschool==0, by(treatment)

** Open Ended Questions
/* #1 It's concieveable that for a person with young children, they might not see
the benefit of the treatment until the child grows older and they're able to
focus more on their professional growth. My hypothesis is that the differential
between parents and non-parents will be smaller in year4 than in year1.

The emphasis on short-term job placement rather than longer-term skill building
may lead to flattening of the effect of the program.


*/

reg year4 child if treatment==1
reg year4 child if treatment==0
reg year1 child if treatment==1
reg year1 child if treatment==0


/* the results of this regression show that if for participants with children,
 the treatment did not have a significant effect on earnings. After4 years, 
 there is a significant effect for parents in the treatment group. */


reg year1 treatment
reg year4 treat

/* the results of these regressions show that being part of the treatment group
  is correlated with increase wages at year1 and year4. The r-squared value is
  higher in the year1 model, meaning that being in the treatment group explains
  more of the variation in earnings for at year1 than year4. 


