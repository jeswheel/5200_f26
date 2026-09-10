# Load the data:
#   - read.csv, read.txt, or manual
stichTimes <- c(
  1.03, -.04, .26, .30, -.97, .04, -.57, 1.75, .01, .42, .45, -.8, .39, .25,
  .18, .95, -.18, .71, .42, .43, -.48, -1.08, -.57, 1.10, .27, -.45, .62, .21, 
  -.21, .82
)

# Don't forget to check options:
#   ?t.test
t.test(stichTimes, alternative = 'greater')

# Check assumptions
hist(stichTimes)
boxplot(stichTimes)
qqnorm(stichTimes)
qqline(stichTimes)
