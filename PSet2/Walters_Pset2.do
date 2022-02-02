import delimited "/Users/jeremywalters/Documents/GitHub/PUBLPOL303D/PSet2/nls_2021.txt", delimiter(space, collapse) clear 
rename v2 luwe
rename v3 educ
rename v4 exper
rename v5 age
 rename v6 fed
rename v7 med
rename v8 kww
rename v9 iq
drop v1

Hist educ


/** 1. This distribution doesn't look normal, it peaks around 12, which marks
high school graduation. The most likely value are 12(high school graduation)
and 16(college graduation).**/

gen eduband=1 if educ==16
replace eduband=0 if educ==12
ttest luwe,by(eduband)


/** 2. Ttest reveals that there is a statistically significant difference
in wages earned for people with extactly 12 and exactly 16 years of
education.
 **/


twoway (scatter luwe educ), ytitle(Log Earnings) xtitle(Years of Schooling)

/** 3. The scatter plot shows that within the 12-16 educ band, there doesn't 
appear to be very much variation in earnings, and that there are a number of 
subjects who did not finish high school that are making wages comparable to
high school graduates. There does not appear to be a clear positive correlation
between years of schooling and log earnings. **/


binscatter luwe educ

/** 
4. With the binscatter command, the clear positive correlation between years
of schooling and wages reveals itself. The scatter plot from Q2 did not show
this clear trend.
**/

regress luwe educ

/** 
5. For test subjects with zero years of education, the mean log of earnings
is 5.07 with a standard error of 0.087. For each additional year of education, 
test subjects can expect an average log earnings increase of .066 with a 
standard error of 0.0064. 
**/


/**
6.  With the binary variable that I generated, I get the mean for 12 years and 
for 16 years in the output of the T-test. The difference between them is 
(.2675635). The results of the regression show that each year of education leads
to an increase in salary of (.0652). If I multiply the coefficient by 4, I get 
.2606, which is relatively close to the value from the T-test, when considering
the Standard Error of the difference.
**/

/**


