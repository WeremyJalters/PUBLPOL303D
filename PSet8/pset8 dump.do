use "/Users/WaltersJ/Documents/GitHub/PUBLPOL303D/PSet8/minimum.dta"
lab
dlabel chain
describe chain
tab chain
display 134+62+84+47
tab co_owned
tab nj
ttest chain, by(nj)
tab
tabstate
tabstat
tabstat chain co_owned nj empft1 emppt1 wage_st empft2 emppt2
tab chain co_owned nj empft1 emppt1 wage_st empft2 emppt2
describe chain
tab chain
tab wage
drop if wage_st==-9
tab wage if nj==1
drop if wage_st==1
drop if wage_st==2
generate co_owned_c=0 if co_owned<0
replace co_owned_c=1 if co_owned>0
drop co_owned_c
gen co_owned_c=0
replace co_owned_c==1 if co_owned>0
replace co_owned_c=1 if co_owned>0
tab co_owned
disp 153+14+15+12
tab wage
drop if wage_st==3
describe empft2
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
sum empft1
sum empft1
drop if empft1==-9
drop if empft2==-9
drop if empft2==-9
drop if empppt2==-9
drop if emppt2==-9
sum empft1
sum empft1 empft2
sum empft1 empft2 if nj==1
sum empft1 empft2 if nj==1
sum emppt1 emppt2 if nj==1
ttest emppt1 emppt2
generate empft_diff= empft2-empft1
generate emppt_diff= emppt2-emppt1
regress empft_diff chain wage_st co_owned_c
regress empft_diff chain wage_st co_owned_c
regress empft_diff chain wage_st co_owned_c nj
regress empft_diff chain wage_st co_owned_c nj nj_south nj_central nj_north
regress empft_diff chain wage_st co_owned_c nj nj_south nj_central nj_north emppt_diff
regress emppt_diff chain wage_st co_owned_c nj nj_south nj_central nj_north empft_diff
ttest empft_diff, by(nj)
ttest empft_diff, by(nj)
ttest emppt, by(nj)
ttest emppt_diff, by(nj)
tab chain
gen big_chain=0
replace big_chain=1 if chain<=4
tab chain
disp 118+59+76+38
regress empft_diff chain nj nj_south nj_central nj_north co_owned_c big_chain
regress emppt_diff chain nj nj_south nj_central nj_north co_owned_c big_chain
regress emppt_diff chain nj nj_south nj_central nj_north co_owned_c 
regress emppt_diff chain nj nj_south nj_central nj_north co_owned_c big_chain
regress empft_diff chain nj nj_south nj_central nj_north 
regress empft_diff chain nj nj_south nj_central nj_north co_owned_c big_chain
