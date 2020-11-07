count.CI <- function(n, y, alpha = 0.05) {
  pi.hat <- y/n
  q <- qnorm(1-alpha/2)
  Wald.se <- sqrt(pi.hat*(1-pi.hat)/n)
  Wald.lower <- pi.hat - q*Wald.se
  Wald.upper <- pi.hat + q*Wald.se
  y2 <- y + 0.5*q^2
  n2 <- n + q^2
  pi.hat2 <- y2/n2
  WAC.se <- sqrt(pi.hat2 * (1-pi.hat2)/n2)
  WAC.lower <- pi.hat2 - q*WAC.se
  WAC.upper <- pi.hat2 + q*WAC.se
  cat("Wald", 100*(1-alpha), "% CI is: \n")
  cat(Wald.lower, Wald.upper)
  cat("\n")
  cat("WAC", 100*(1-alpha), "% CI is: \n")
  cat(WAC.lower, WAC.upper)
  cat("\n")
  return(list(Wald = c(Wald.lower, Wald.upper), WAC = c(WAC.lower, WAC.upper)))
}

  
  