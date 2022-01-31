import delimited "/Users/jeremywalters/Documents/GitHub/PUBLPOL303D/PSet3/lottery.txt", delimiter(space, collapse) 
drop v1
rename v2 earn
rename v3 prize
rename v4 lagged_earn
rename v5 age
rename v6 male
rename v7 educ
rename v8 tixbot
rename v9 workthen
regress earn prize earn*prize
regress earn prize earn##prize
regress earn prize c.earn##prize
gen earnprize = earn*prize
regress earn prize earn prize earnprize
drop earnprize
reg earn prize
reg earn prize workthen
reg earn prize workthen age lagged
gen winner=1
replace winner=0 if prize==0
gen winner=1
replace winner=0 if prize==0
reg earn prize workthen age lagged winner if winner==1
reg earn prize workthen age lagged winner if 
reg earn prize workthen age lagged winner 
reg earn prize workthen age lagged winner c.lagged##c.prize
reg earn  c.lagged##c.prize
reg earn lagged prize
gen totalfund= prize+laggedearn
gen totalfunds = prize+lagged
reg earn totalfunds
reg earn prize
reg earn lagged
reg earn lagged prize
reg earn lagged prize male
reg earn lagged prize age
gen retire = age*prize
reg earn retire
gen senior = 1
replace senior=0 if age<60
reg earn senior
reg earn age
reg earn age if age==1
reg earn senior if senior==1
reg earn prize
reg earn prize if winner==1
reg earn prize
tabstat winner
sum winner
sum winner if winner==1
ttest prize by(winner)
ttest prize, by(winner)
test lagged, by(winner)
ttest lagged, by(winner)
ttest tix, by(winner)
reg earn age
reg earn prize
regress earn prize senior==0
regress earn prize if senior==0
reg earn prize if senior==1
reg earn prize senior
ttest earn, by(senior)
ttest earn, by(senior) unequal
sum earn if senior==0
sum earn if senior==1
reg earn prize senior
reg earn prize
reg earn prize senior workthen
reg earn prize if senior==0
reg earn prize workthen if senior==0
reg earn prize workthen if senior==0
reg earn prize workthen lagged if senior==0
reg earn prize workthen lagged tix edu if senior==0
reg earn prize workthen lagged edu if senior==0
corr
gen lowwin = 1
tabstat prize
sum prize
count prize
hist prize
replace lowwin=0 if prize<19
drop lowwin
gen lowwin=1
replace lowwin=0 if prize>20
drop if prize==0
ttest earn, by(lowwage)
ttest earn,by(lowwin)
replace lowwin=0 if prize<18
ttest earn,by(lowwin)
drop lowwin
drop if senior==1
reg earn prize workthen lagged 
label variable earn "Money earned after winning lotto"
label variable prize "Amount of lotto prize money won"
label variable lagged_earn "Earning 6 years prior to lotto win"
label variable age "age in years"
label variable male "indicator for being male"
label variable educ "years of education in years"
label variable tixbot "number of tix bought per week"
label variable workthen "an indicator for working when tix were bought"
label variable winner "indicator for winning the lotto"
label variable totalfunds "lagged earnings plus prize"
label variable retire "indicator for age over 60"
label variable senior "old age indicator"
import delimited "/Users/jeremywalters/Documents/GitHub/PUBLPOL303D/PSet3/lottery.txt", delimiter(space, collapse) 
drop v1
rename v2 earn
rename v3 prize
rename v4 lagged_earn
rename v5 age
rename v6 male
rename v7 educ
rename v8 tixbot
rename v9 workthen
label variable earn "Money earned after winning lotto"
label variable prize "Amount of lotto prize money won"
label variable lagged_earn "Earning 6 years prior to lotto win"
label variable age "age in years"
label variable male "indicator for being male"
label variable educ "years of education in years"
label variable tixbot "number of tix bought per week"
label variable workthen "an indicator for working when tix were bought"
reg earn prize
mean earn
mean earn if prize==0
reg age prize
reg male prize
reg educ prize
reg tixbot prize
reg workthen prize
reg lagg prize
gen winner=1
replace winner=0 if prize==0
label variable winner "indicator for winning the lotto"
summ
summ winner
tabstat winner
tab winner
drop if winner==0
tab winner
gen senior =0
replace senior=1 if age>=60
drop if senior==1
reg earn prize
reg earn prize lagg
reg earn prize lagg workthen
corr
reg earn prize lagg workthen age
regress lagg educ
reg earn prize lagg workthen age educ
mean earn if lagg<=40
mean earnings
mean earn
reg earn prize lagg workthen age educ lagg#prize
reg earn prize lagg workthen age educ c.lagg#prize
reg earn prize lagg workthen age educ c.lagg#c.prize
reg earn prize lagg workthen age educ c.earn#c.lagg
corr
reg earn prize lagg##workthen age educ 
reg earn prize c.lagg##i.workthen age educ 
reg earn prize lagg workthen age educ c.prize#c.lagg
