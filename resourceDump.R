## 1 to search for a string in a list of lists (not safe, but does the job apparently)
listoflists[grep('searchterm', listoflists)] # output: vector of indices
# can also pipe length to it 
## 2 ni operator
'%ni%' <- Negate('%in%')
## 3 Remove element by value from list of lists
# unlist is optional
# y is the value you want to remove
listoflists <- lapply(listoflists, setdiff, y="value_to_remove") %>% unlist()
# e.g.
> ingredients
[[1]]
[1] "primi piatti" ""             ""             ""             ""            
[6] ""             ""             ""             ""             ""            
[11] ""             ""             ""             ""             ""            
[16] ""             ""             ""             ""             ""            
[21] ""             "gnocchi"  
> ingredients <- lapply(ingredients, setdiff, y="") %>% unlist()
> [1] "primi piatti" "gnocchi"  
