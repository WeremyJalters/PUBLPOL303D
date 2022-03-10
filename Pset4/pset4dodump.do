import delimited "/Users/jeremywalters/Documents/GitHub/PUBLPOL303D/Pset4/HousePrices.csv"
do "/var/folders/yq/5w2tk0k50sv7t0kmljnp_c6r0000gn/T//SD01925.000000"
do "/var/folders/yq/5w2tk0k50sv7t0kmljnp_c6r0000gn/T//SD01925.000000"
mean saleprice if training==1
sum training holdout
count if training ==1
count if training==0
count if holdout==1
mean saleprice if training==1
mean saleprice if holdout==1
sum saleprice if training==1
gen ndiff= (saleprice- `r(mean)')^2
sum ndiff if holdout==1
mean ndiff if holdout==1
reg saleprice i.yrsold i.bedroom
reg saleprice i.yrsold i.bedroom if training==1
sum yrsold
sum bedroom
