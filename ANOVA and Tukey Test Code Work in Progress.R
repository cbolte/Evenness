#Work in Progress
model3 <- lm(proportion ~ rank * as.factor(year), data=gsturg_prop) # Correct?
summary(model3)
result <- aov(model3)
summary(result)

model3$coefficients

test_tukey <- TukeyHSD(result)
test_tukey