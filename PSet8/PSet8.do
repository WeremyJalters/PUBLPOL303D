// Explore chain variable
tab chain

// Generate big_chain dummy
gen big_chain=0
replace big_chain=1 if chain<=4

// Drop instances with missing values

drop if wage_st==-9
drop if wage_st==1
drop if wage_st==2

// Check out the values of the wage_st variable

hist wage_st if nj==1

// Create dummy variable for big chain
gen co_owned_c=0
replace co_owned_c=1 if co_owned>0


// Drop entries where starting wage is 2 dollars or less
drop if wage_st==1
drop if wage_st==2
drop if wage_st==3

// look at employment for time period 1, Full Sample
histogram empft1
histogram empft2
histogram emppt1
histogram emppt2

// Visual, NJ only, Full Time, Period 1 and Period 2
histogram empft1 if nj==1
histogram empft2 if nj==1

// Visual, NJ only, Part Time, Period 1 and Period 2
histogram empft1
histogram emppt1
histogram empft1
histogram empft2
histogram emppt2
histogram empft2
histogram empft1 if nj==1
histogram empft2 if nj==1
histogram empft1
histogram empft2
histogram emppt1
histogram emppt2

// Are the regions of NJ significantly different?
ttest

// Create change in employment as Y variable (pre/post diff)
generate empft_diff= empft2-empft1
generate emppt_diff= emppt2-emppt1

// T-tests on new variables, by state
ttest empft_diff, by(nj)
// Regression for full-time
regress empft_diff
