2-14 class

// ols relationship
reg annwage veteran

// table of draft vs veteran status
tab vet draft

// share of never takers
disp 1700/2400

tab veteran draft, sum(annwage)

// How to get all that done for us, 2 stage LS
ivreg annwage (veteran=draft)
