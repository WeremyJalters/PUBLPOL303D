// load data
use "/Users/jeremywalters/Documents/GitHub/PUBLPOL303D/Pset6/census.dta"

// In question 5, jointly test something, use regress test with dummy variables
to do this joint test

// xi command before the ivreg with categorical variables

// 1. With a mean of 439.4713 and the age of the data, it is likely weekly wage.


// 2. 
 regress lwage educ
 
 
 // 3.
   regress lwage educ i.yob i.sob
   
   // Adding these dummy variables produce a slight decrease in the coefficient
   
// 4.  
    regress  educ 4.qob
	// There is a significant positive effect for being born in q4, yes.
   
    
   
 // 5. 
     regress educ i.qob, coefl
	 test 2.qob 3.qob 4.qob

	 
 //  there appears to be a significant positive effect for being born in after
   // q1.
   
   
 
 // 7. 
   regress lwage educ i.qob
   // adding qob doesn't change the coeffient is a significant way as 
   //compared to question 2, but two of the dummies aren't significant.
   
   
 // 8.
