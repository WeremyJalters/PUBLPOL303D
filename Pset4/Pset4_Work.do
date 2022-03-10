import delimited "/Users/jeremywalters/Documents/GitHub/PUBLPOL303D/Pset4/HousePrices.csv"

/* 2. Set your random seed to 157911 and then randomly partition the data into a
70% training data set and a 30% test data set. What is the average sale price in
the training data? What is the average sale price in the test (hold out sample)
data?*/

set seed 157911

//This gives us the index value to use to split the data into 70/30 portions
gen index=uniform()
hist index

// With the data indexed, this established the groups
gen training=0
replace training=1 if index<.7
gen holdout=index>=.7
sum training holdout
mean saleprice if training==1
mean saleprice if training==0

/* 2.The simplest prediction model ("Naive Model") would predict the average
sale price in the training data for every instance. If you apply this naive
model, what RMSE (root mean square error) do you get for the prediction
error in the test data? */

//generate the mean squared error and see how well it predicts sales price
// with the holdout/test data.
sum saleprice if training==1
gen ndiff= (saleprice- `r(mean)')^2
sum ndiff if holdout==1

/* 3. Construct a prediction model ("Model 1"), by running a regression of sale
price on dummies for each year sold and dummies for each number of bedrooms
(seven possible values). Use the training data to run the regression.
What is the interpretation of the intercept? What is the interpretation of the
coefficient on yrsold=2007?*/

reg saleprice i.yrsold i.bedroom if training==1

* 4.

reg saleprice i.yrsold i.bedroom if training==1
predict sale_hat1 if holdout==1
gen mse1=(saleprice-sale_hat1)^2





* 5.
reg saleprice grlivarea age_at_sale i.bedroom i.yrsold if training==1


* 7.
tabstat ndiff mse1 mse2 if holdout==1, format(%20.2f)
display sqrt(5246677099.69)
display sqrt(4884561014.69)
display sqrt(2213190713.50)




*9. 
xi: lasso linear saleprice i.mszoning_f i.lotshape_f i.bldgtype_f i.neighborhood_f 
i.fullbath i.halfbath i.bedroom i.kitchen i.mosold i.yrsold lotarea lotareasq 
age_at_sale agesqure agecube firstflrsf secondflrsf grlivarea if training==1

*10.
set seed 12347
xi: lasso linear saleprice i.mszoning_f i.lotshape_f i.bldgtype_f i.neighborhood_f i.fullbath i.halfbath i.bedroom i.kitchen i.mosold i.yrsold lotarea lotareasq age_at_sale agesqure agecube firstflrsf secondflrsf grlivarea if training==1
lassocoef
predict sale_hat5 if holdout==1
gen mse5=(saleprice-sale_hat5)^2
sum mse5
display sqrt(1.32e+09)
