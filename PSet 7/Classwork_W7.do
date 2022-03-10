// Probability a democrat wins next time vs those rounds demo share
binscatter demwinnext difdemshare, rd(0)

ssc install rd 
ssc install rdrobust

// make rd plot
rdplot demwinnext difdemshare

// Create density plot
hist difdemshare, xline(0)

rd demwinnext difdemshare, z0(0)
rdplot demwinnext difdemshare, h(.15) kernal(epanechnikov) p(1)


//fuzzy outcome-treatment-running

rd rdge1 summer rdge0, z0(2.79)

