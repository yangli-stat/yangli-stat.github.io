count.CI <- function(n1, y1, n2 = NULL, y2 = NULL, alpha = 0.05) {
  z <- qnorm(1-alpha/2)
  if (is.null(n2) | is.null(y2)) {
    pi1 <- y1/n1
    Wald.se <- sqrt(pi1*(1-pi1)/n1)
    Wald.lower <- pi1 - z*Wald.se
    Wald.upper <- pi1 + z*Wald.se
    y1.c <- y1 + 0.5*z^2
    n1.c <- n1 + z^2
    pi.c <- y1.c/n1.c
    WAC.se <- sqrt(pi.c * (1-pi.c)/n1.c)
    WAC.lower <- pi.c - z*WAC.se
    WAC.upper <- pi.c + z*WAC.se
    cat("Wald", 100*(1-alpha), "% CI is: \n")
    cat(Wald.lower, Wald.upper)
    cat("\n")
    cat("WAC", 100*(1-alpha), "% CI is: \n")
    cat(WAC.lower, WAC.upper)
    cat("\n")
    return(list(Wald = c(Wald.lower, Wald.upper), WAC = c(WAC.lower, WAC.upper)))
  }
  else {
    pi1 <- y1/n1
    pi2 <- y2/n2
    diff.lower <- pi1-pi2 - z*sqrt(pi1*(1-pi1)/n1+pi2*(1-pi2)/n2)
    diff.upper <- pi1-pi2 + z*sqrt(pi1*(1-pi1)/n1+pi2*(1-pi2)/n2)
    cat("A", 100*(1-alpha), "% CI for pi1-pi2 is: \n")
    cat(diff.lower, diff.upper, "\n")
    return(c(diff.lower, diff.upper))
  }
}

  
  