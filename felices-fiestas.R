# Title: "Felices Fiestas" card in R
# Date: Dec-23-2023
# Author: Gaston Sanchez


# 1st set of lights
x1 = 0:6
y1 = x1^2 + 25

# 2nd set of lights
x2 = x1[2:6] + 0.25
x2 = seq(from = x1[2] - 0.5, to = x1[7] + 0.25, length.out = 10)
x2aux = seq(from = -5.9, to = -1.9, length.out = 10)
y2 = x2aux^2 + x2 + 20

# left branch
leafs1 = rbind(
  c(1.5, 0),
  c(1.5, -12),
  c(1, -7),
  c(1.1, -2.5),
  c(1.6, -7))

branches1 = rbind(
  c(x0 = 0.9, y0 = -18, x1 = 1.5, y1 = 0),
  c(x0 = 1.07, y0 = -13, x1 = 1.5, y1 = -12),
  c(x0 = 1.16, y0 = -10, x1 = 1, y1 = -7),
  c(x0 = 1.3, y0 = -6, x1 = 1.1, y1 = -2.5),
  c(x0 = 1.23, y0 = -8, x1 = 1.6, y1 = -7)
)

# right branch
leafs2 = rbind(
  c(5, 0),
  c(5, -12),
  c(5.5, -7),
  c(5.4, -2.5),
  c(4.8, -7))

branches2 = rbind(
  c(x0 = 5.5, y0 = -18, x1 = 5, y1 = 0),
  c(x0 = 5.36, y0 = -13, x1 = 5, y1 = -12),
  c(x0 = 5.28, y0 = -10, x1 = 5.5, y1 = -7),
  c(x0 = 5.17, y0 = -6, x1 = 5.4, y1 = -2.5),
  c(x0 = 5.22, y0 = -8, x1 = 4.8, y1 = -7)
)


# Card (saved as PNG, dimensions 5.5x5.5 inches)
png("felices-fiestas.png", res = 200, height = 5.5, width = 5.5, units = 'in')
op = par(bg = "#faf8f5", mar = rep(0,4), bty = "n", xaxt = "n", yaxt = "n")
plot(x1, y1, type = "n", xlim = c(1, 5.55), ylim = c(-12, 50))

# snowflakes
set.seed(182)
points(runif(30, 1, 6), runif(30, -15, 55), pch = 8, 
       cex = runif(30, 0.5, 1.3), col = c("#1d596e", "#4abdbd", "orange"))

# lights
lines(x2, y2)
points(x2, y2 - 1, pch = 21, cex = 2.5, col = "black", 
       bg = c("white", "#fc3048"))
lines(x1, y1)
points(x1, y1 - 1, pch = 21, cex = 3, col = "black", 
       bg = c("white", "orange"))

# bottom left branch
segments(branches1[,1], branches1[,2], branches1[,3], branches1[,4])
points(leafs1[,1], leafs1[,2], pch = 19, cex = 2, 
       col = c("#4abdbd", "#1d596e"))

# bottom right branch
segments(branches2[,1], branches2[,2], branches2[,3], branches2[,4])
points(leafs2[,1], leafs2[,2], pch = 19, cex = 2, 
       col = c("#4abdbd", "#1d596e"))

# merry christmas
text(x = 1.6, y = 15, adj = 0, labels = "Felices Fiestas",  
     family = "HersheyScript", font = 4, cex = 4, col = "#fc3048")

# close graphics device
par(op)
dev.off()

