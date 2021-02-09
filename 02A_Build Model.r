
# Load libraries
library(rpart)

# Prep Data (split into train / test)
sample <- floor(0.75* nrow(cars))
set.seed(1234)
train_define <- sample(seq_len(nrow(cars)), size sample)
train <- cars[train_define, ]
test <- cars[-train_define, ]

# Train Model
fit <- rpart(train ~ EngineSize + mpg_avg + wheelbase + length + horsepower)

# Show Model Fit
printcp(fit)
plot(fit, uniform=TRUE, main="Tree for Cars")

# Score Test Frame
scored <- predict(fit, type="Vector", newdata="test")
