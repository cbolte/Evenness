install.packages('lsmeans')
install.packages("multcompView")
library(lsmeans)
library(multcompView)

prop <- df_prop
prop$year <- paste('year_', prop$year, sep = '')
prop$year

model3 <- lm(proportion ~ rank * year, data=prop) # Correct?
summary(model3)
result <- aov(model3)
summary(result)

leastsquare <- lsmeans(model3, pairwise ~ year:rank, adjust='tukey')
df_posthoc <- summary(leastsquare)
test <- df_posthoc$contrasts

df_pairwise <- as.data.frame(test)
write.csv(df_pairwise, 'Post Hoc Tests of Rank-Year Interaction.csv')
