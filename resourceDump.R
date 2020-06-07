## 1 to search for a string in a list of lists (not safe, but does the job apparently)
listoflists[grep('searchterm', listoflists)] # output: vector of indices
# can also pipe length to it 
## 2 ni operator
'%ni%' <- Negate('%in%')
