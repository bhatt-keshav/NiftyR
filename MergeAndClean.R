library(tidyverse)
library(magrittr)
data(iris)
iris %>% names()
iris1 <- iris %>% select(Petal.Length, Petal.Width, Species) %>% distinct(Species, .keep_all = T)
iris2 <- iris %>% select(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species) %>% distinct(Species, .keep_all = T)


MergeAndClean <- function(x, y, key) {
  drops <- intersect(names(x), names(y)) %>% .[!. %in% key] 
  y %<>% select(-drops) 
  x_y <- merge(x, y, by = key)
  return(x_y)
}

x_y <- MergeAndClean(x = iris1, y = iris2, key)
       

x <- iris1
y <- iris2
key <- 'Species'

commonNames <- intersect(names(x), names(y))
repeatedCols <- commonNames[!commonNames %in% key]
y <- y[ , !(names(y) %in% repeatedCols)]
x_y <- merge(x, y, by = key)

drops <- intersect(names(x), names(y)) %>% .[!. %in% key] 
y %<>% select(-drops) 
y

## Publish in love pipes
df$vars %>% duplicated() %>% df$vars[.]
drops <- intersect(names(x), names(y)) %>% .[!. %in% key]

drops <- intersect(names(x), names(y))
drops[!drops %in% key]
intersect(names(x), names(y))[!(intersect(names(x), names(y))) %in% key]
