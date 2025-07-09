#' Adaptive Mixture Categorization
#'
#' @description
#' This is the function for the Adaptive Mixture Categorization, which can categorize variables in a flexible way using F-statistic.
#' @param data The input data for categorization (should be a data frame)
#'
#' @return categorization thresholds.
#' \item{output}{The categorized data}
#' \item{cutoff}{The thresholds/cutoffs of the categorization for each variable}
#' \item{group}{The number of categories for each variable}
#' @export
#'






negative_between_group_variance <- function(threshold, thres1, data) {
  groupt <- c(thres1, threshold)
  groupt <- unique(groupt)
  ll <- length(groupt) -1
  categ <- cut(data, breaks= groupt, labels = 1:ll)
  gmean <- tapply(data, categ, mean)
  omean <- mean(data)
  between_group_variance <- sum((gmean-omean)^2*table(categ))
  #between_group_variance 
  return(between_group_variance)
}


amc = function(data){
thres1 <- c(-1, max(data, na.rm=T)*1.1)
temp <- 0

#sort(datax[,2])[order(temp, decreasing=T)[1:20]]

temp <-  diff(sort(data))
tt <- min(1000, length(temp))
thres <- sort(data)[order(temp, decreasing=T)[1:tt]]
threshold1 <- 0
op1 <- op2 <- 0
temp <- 0
for (f in 1:10){

for (i in 1:tt){

temp[i] <-  negative_between_group_variance(thres[i], thres1, data)

}

position = which.max(temp)
threshold1[f] <- thres[position]
thres1 <- c(thres1, thres[position])
groupt <- unique(thres1)
ll <- length(groupt) -1
categ <- cut(data, breaks= groupt, labels = 1:ll)
fit <-  aov(data~categ)
op1[f] <- pf(summary(fit)[[1]][1,4], summary(fit)[[1]][1,4], summary(fit)[[1]][1,4], log.p=T)
op2[f] <- summary(fit)[[1]][1,4]
}

opti <- (1:10)[op1 ==min(op1)][op2[(1:10)[op1 ==min(op1)]] == max(op2[(1:10)[op1 ==min(op1)]])]
thresf = threshold1[1:opti]
return(thresf)

}


