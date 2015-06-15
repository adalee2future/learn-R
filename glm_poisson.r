


mdl <- glm(visits ~ date,poisson, hits)
summary(mdl)
exp(confint(mdl, 'date'))
which.max(hits[,'visits'])
lambda <- mdl$fitted.values[704]
qpois(.95, lambda)
mdl2 <- glm(formula = simplystats ~ date, family = poisson, data = hits, offset = log(visits + 1))
summary(mdl2)
qpois(.95, mdl2$fitted.values[704])