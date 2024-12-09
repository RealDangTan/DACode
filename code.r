# Câu 1
install.packages("reshape2")
library(reshape2)
data1 <- read.table("DATA1.txt", header = TRUE)
data1_melt <- melt(data1, id.vars = "MADL")
print(data1_melt)

# Câu 2
install.packages("quantmod")
library(quantmod)
ngay_sinh <- "08-21"
getSymbols("AAPL", src = "yahoo", from = "2021-01-01", to = paste0("2021-", ngay_sinh))
chartSeries(AAPL, theme = "white")

# Câu 3
data3 <- read.table("DATA3.txt", header = TRUE)
n <- ncol(data3)
m <- nrow(data3)
heatmap(as.matrix(data3), scale = "none", col = heat.colors(100))
tour_frequency <- table(apply(data3, 2, sum))
barplot(tour_frequency, main = "Tần suất đăng ký tour du lịch", xlab = "Tour du lịch", ylab = "Số lượng nhóm khách hàng")

# Câu 4
data4 <- read.table("DATA4.txt", header = TRUE)
model <- lm(data4[, 1] ~ ., data = data4)
optimal_model <- step(model, direction = "both")
summary(optimal_model)

# Câu 5
install.packages("factoextra")
library(factoextra)
data5 <- read.table("DATA5.txt", header = TRUE)
fviz_nbclust(data5, kmeans, method = "wss") 
k <- 3 
kmeans_result <- kmeans(data5, centers = k)
fviz_cluster(kmeans_result, data = data5, ellipse.type = "convex")
