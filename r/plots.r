income <- read.csv(file = './data/data.csv')

# quantiles for medians across provinces
quantile(income$female)
#    0%   25%   50%   75%  100% 
# 25314 27543 28676 31978 46322 
quantile(income$male)
#    0%   25%   50%   75%  100% 
# 28817 37842 40370 46117 54924 

jpeg('plots/boxplot.jpg')
# set margins
par(mar = c(4,6,4,6))
# generate boxplots!
# can add (income$female + income$male)/2 as data to boxplot average
boxplot(
  income$male, 
  income$female, 
  las=2,
  col=c("green","darkgreen"),
  xaxt="n",
  main="Boxplots of median incomes across\nprovinces by gender (2016)"
)
# manually add y-axis label so it doesn't intersect axis mark labels!
title(ylab="Total Income", line=4)
# add line for true Canadian mean total income = 34204
abline(h=34204, lty=2)
mtext("true median", side=4, at=34204, las=2, adj=-0.1)
# legend
legend(
  "topright", 
  legend=c("Female", "Male"), 
  fill=c("darkgreen", "green"), 
  cex=1.2, 
  inset=.02
)
dev.off()


# plot to jpg
jpeg('plots/ratio.jpg')
# set margins
par(mar = c(12,4,4,3))
# generate line plot
plot(
  income$ratio, 
  type="l", 
  ylab="Ratio (Females/Males)", 
  xaxt="n", 
  xlab="", 
  main="Ratio Between Median Incomes For\nFemales and Males in Canada, by Province (2016)"
)
# label x-axis with provinces
axis(1, at=1:13, labels=unique(income$name), las=2)
# add and label y=1 equal ratio line
abline(h=1, lty=2)
mtext("equal", side=4, at=1, las=2, adj=-0.25)
# add points and labels on minimum and maximum values
text(which.max(income$ratio) - 0.75, max(income$ratio), labels=round(max(income$ratio), digits=4))
points(which.max(income$ratio), max(income$ratio), pch=19)
text(which.min(income$ratio) + 0.75, min(income$ratio), labels=round(min(income$ratio), digits=4))
points(which.min(income$ratio), min(income$ratio), pch=19)
# close jpeg
dev.off()


# plot to jpg
jpeg('plots/lines.jpg')
# margins
par(mar = c(12,6,4,2))
# generate plot
plot(
  income$female, 
  ylab="",
  type="l", 
  xaxt="n", 
  xlab="", 
  main="Median Income For Females and\nMales in Canada, by Province (2016)",
  ylim=c(min(income$female, income$male), max(income$female, income$male)),
  col="darkgreen",
  las="2"
)
title(ylab="Total Income", line=4)
# add second line
lines(income$male, col="green")
# add province labels
axis(1, at=1:13, labels=unique(income$name), las=2)
legend(
  "topleft", 
  legend=c("Female", "Male"), 
  fill=c("darkgreen", "green"), 
  cex=0.8, 
  inset=.02
)
dev.off()