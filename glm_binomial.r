// odds = p/(1-p)
//log(p/(1-p)) = b0 + b1*score

mdl <- glm(ravenWinNum ~ ravenScore, binomial, ravenData)
lodds <- predict(mdl, data.frame(ravenScore=c(0, 3, 6)))
exp(lodds)/(1+exp(lodds))
summary(mdl)
exp(confint(mdl))
anova(mdl)
qchisq(.95, 1)