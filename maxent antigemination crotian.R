library(maxent.ot)

sa_croatian <- read.table("croatian sa.txt", header = TRUE)

#fit the model
maxent_croatian <- optimize_weights(sa_croatian)

#save learned weights as a separate object
weights <- round(maxent_croatian$weights,4)

#calculate probabilities
prob <- predict_probabilities(sa_croatian, weights)

#round the probabilities and convert proportions to percentages
prob$predictions$Predicted <- 100*round(prob$predictions$Predicted, 4)
prob$predictions$Observed <- 100*round(prob$predictions$Observed, 4)
prob$predictions$Error <- 100*round(prob$predictions$Error, 4)

#goodness of fit plot (observed against predicted values)
plot(prob$predictions$Observed,prob$predictions$Predicted,xlab = "Observed", ylab = "Predicted")
#add a diagonal line
abline(a = 0, b = 1, col = "red", lwd = 2)
