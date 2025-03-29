# install.packages("arules")
library("arules")
library("dplyr")
rm(list=ls()); cat("\014")

data("Adult")
Adult
summary(Adult)

inspect(Adult[0:5]);


rules <- apriori(Adult, parameter=list(support=0.5, 
                                       confidence=0.8,
                                       target="rules"))
summary(rules);
as(head(sort(rules, by = c("confidence", "support")), n=3), "data.frame")


# input data.frame
# data = read.csv("top_supermarket_transactions.csv")
# row.names(data) <- data[[1]]
# data = data %>% dplyr::select(-Items)

data("Groceries")
rules <- apriori(Groceries, parameter=list(support=0.01, 
                                       confidence=0.2,
                                       target="rules"))
inspect(rules[1:10])

View(crossTable(Groceries, measure="count", sort=TRUE))
View(crossTable(Groceries, measure="support", sort=TRUE))
View(crossTable(Groceries, measure="lift", sort=TRUE))



# summary(rules);
# as(head(sort(rules, by = c("confidence", "support")), n=3), "data.frame")

