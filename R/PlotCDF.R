PlotCDF <- function(x, fx, plot.vertical = TRUE, pch = 16, pch2 = 1, p.col = "black", l.col = "black", p.cex = 1, lty = 1, lwd.solid = 1, lwd.dash = 0.5, xlab = "x", ylab = "F(x)", ymin = 0, ymax = 1, ...) {
  x <- sort(x)
  fx <- fx[order(x)]
  xRange <- max(x) - min(x)
  xMin <- min(x) - 0.1*xRange
  xMax <- max(x) + 0.1*xRange
  n <- length(x)
  y <- cumsum(fx)
  plot(x, y, xlim = c(xMin, xMax), xlab = xlab, ylab = ylab, type = "n", ylim = c(ymin, ymax), cex.lab = 1.5, ...)
  y <- c(0, y)
  if (plot.vertical) {
    for (i in 1:n) {
      lines(x = rep(x[i], 2), y = c(y[i], y[i+1]), lty = 3, col = l.col, lwd = lwd.dash)
    }
  }
  for (i in 1:(n-1)) {
    lines(x = c(x[i], x[i+1]), y = rep(y[i+1], 2), lwd = lwd.solid, col = l.col, lty = lty)
  }
#  lines(x = c(x[n], xMax), y = rep(y[n], 2), lwd = lwd.solid, col = l.col, lty = lty)
  arrows(x0 = x[n], x1 = xMax, y0 = y[n+1], y1 = y[n+1], lwd = lwd.solid, col = l.col, lty = lty, length = 0.1)
  arrows(x0 = x[1], x1 = xMin, y0 = 0, y1 = 0, lwd = lwd.solid, col = l.col, lty = lty, length = 0.1)
  points(x, y[-1], pch = pch, col = p.col, cex = p.cex)
  points(x, y[-length(y)], pch = pch, col = "white", cex = p.cex)
  points(x, y[-length(y)], pch = pch2, col = p.col, cex = p.cex)
}
