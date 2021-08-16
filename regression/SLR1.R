prod <- read.table("http://yangli.us/regression/prod.txt", header=T)
fit <- lm(RunTime ~ RunSize, data=prod)
fit$residuals

plot(prod$RunSize, prod$RunTime, xlab="Size", ylab="Time")
abline(fit)

newdata <- as.data.frame(c(100, 150, 200, 250))
colnames(newdata) <- "RunSize"
predict(fit, newdata)
