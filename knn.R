library("xlsx")

nn <- read.xlsx("C:/Users/BhattK2/Desktop/G8.xlsx", 1)
size <- dim(nn)
nRows <- size[1]
start <- 1 + 10
end <- nRows -10

# Initializing
nn$defProb <-  NA

# General case with 10 neighbours
for (i in start: end) {
  nn$defProb[i] <- sum(nn$Ever_Default_flag[(i-10):(i+10)])/20
}

# Boundary cases
nn$defProb[1] <- sum(nn$Ever_Default_flag[1:2]/2)
nn$defProb[nRows] <- sum(nn$Ever_Default_flag[(nRows-1):nRows]/2)
                
# Non top 10 neighbouring cases
for (j in c(2:10)) {
  nghbr <- j - 1
  nghbrs <- c((j - nghbr): (j + nghbr))
  nn$defProb[j] <- sum(nn$Ever_Default_flag[nghbrs])/length(nghbrs)
}

# Non bottom 10 neighbouring cases
for (j in c((end + 1):nRows)) {
  nghbr <- nRows - j
  nghbrs <- c((j - nghbr): (j + nghbr))
  nn$defProb[j] <- sum(nn$Ever_Default_flag[nghbrs])/length(nghbrs)
}

write.xlsx(nn, "outputKNN.xlsx", row.names = FALSE)



