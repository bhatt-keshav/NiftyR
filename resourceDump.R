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

## Call this function with a list or vector to wrap the labels in a barplot (by making \n between the text)
# wrap.it is prerequisite for wrap.labels, use wrap.labels
wrap.it <- function(x, len)
{ 
  sapply(x, function(y) paste(strwrap(y, len), 
                              collapse = "\n"), 
         USE.NAMES = FALSE)
}
# 
wrap.labels <- function(x, len)
{
  if (is.list(x))
  {
    lapply(x, wrap.it, len)
  } else {
    wrap.it(x, len)
  }
}

# e.g.
wr.lap <- wrap.labels(recipeCategoryDFIT$category, 18); wr.lap
# "contenuto sponsorizzato"  becomes "contenuto\nsponsorizzato" 

## 3. Read multiple files from a location
raw_datas <-
  list.files(path = rawdata_locn,
             pattern = "*.sas7bdat", 
             full.names = T) %>% 
  lapply(., read_sas)
# OR for csv
raw_datas <-
  list.files(path = rawdata_locn,
             pattern = "*.csv",
             full.names = T) %>%
  lapply(., read.csv2, header = TRUE, sep = ";", )

# Then Bind all the rows together
bound_raws <- bind_rows(raw_datas)

## 4. Convert all column names to lower case
raw_datas <- lapply(raw_datas, 
                    function(x) {colnames(x) <- tolower(colnames(x)) ;x })

## 5. Convert column types
some_df <- transform(some_df, col1 = as.numeric(col1), 
          col2 = as.numeric(col2),
          date_col = as.Date(date_col, format = '%m/%d/%Y'))


