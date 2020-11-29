PlotZ <- function(x1, x2, mean=0, sd=1, col = "gray", ...) {
  # x1 = -99 means negative infinity
  # x2 = 99 means positive infinity
  xmin <- mean - 3*sd
  xmax <- mean + 3*sd
  curve(dnorm(x, mean, sd), xlim=c(xmin, xmax), yaxs="i", axes = 0, type = "n", ylab = "", ...)

  # define shaded region
  x1.label <- as.character(x1)
  if (x1 == -99) {
    x1 <- xmin
    x1.label <- expression(-infinity)
  }
  x2.label <- as.character(x2)
  if (x2 == 99) {
    x2 <- xmax
    x2.label <- expression(infinity)
  }
  
  S.x  <- c(x1, seq(x1, x2, 0.01), x2)
  S.y  <- c(0, dnorm(seq(x1, x2, 0.01)), 0)
  polygon(S.x, S.y, col=col, border = 0)
  curve(dnorm(x, mean, sd), xlim=c(xmin, xmax), yaxs="i", add = TRUE, ylab = "", ...)
  axis(1)
  lines(x = c(x1, x1), y=c(0, dnorm(x1, mean, sd)), lty = 2)
  lines(x = c(x2, x2), y=c(0, dnorm(x2, mean, sd)), lty = 2)
  xrange <- xmax - xmin
  text(x1+0.03*xrange, 0.015, labels = x1.label, cex = 1.)
  text(x2-0.03*xrange, 0.015, labels = x2.label, cex = 1.)
}

pdf("normalnew3a.pdf", height = 5, width = 5)
PlotZ(x1=-99, x2=0.36, xlab = "z")
dev.off()
pdf("normalnew3b.pdf", height = 5, width = 5)
PlotZ(x1=1.84, x2=99, xlab = "z")
dev.off()
pdf("normalnew3c.pdf", height = 5, width = 5)
PlotZ(x1=-1.97, x2=0.86, xlab = "z")
dev.off()
