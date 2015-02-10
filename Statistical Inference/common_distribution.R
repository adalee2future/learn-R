# at least 3 out of 5 success
pbinom(2, 5, .8, lower.tail = FALSE)

# find the 10th percentile of the standard normal
qnorm(.1)

# Find the 97.5th percentile of a normal distribution
# with mean 3 and standard deviation 2
qnorm(.975, mean = 3, sd = 2)

# a normal distribution with mean 1020 and standard deviation of 50,
# compute the probability that the associated random variable X > 1200
pnorm(1200,1020, 50, lower.tail = FALSE)
pnorm((1200-1020)/50, lower.tail = FALSE)

# find the 75% percentile. Use qnorm and specify the 
# probability (.75), the mean (1020) and standard deviation (50)
qnorm(.75, 1020, 50)

# suppose the number of people that show up at a bus stop is
# Poisson with a mean of 2.5 per hour, and we want to know the
# probability that at most 3 people show up in a 4 hour period
ppois(3, 2.5*4)

# at most 5 successes out of 1000 trials each of which
# has probability .01
pbinom(5, 1000, .01)

# Now use the function ppois with quantile equal to 5 
# and lambda equal to n*p to see if you get a similar result
ppois(5, 1000*.01)
