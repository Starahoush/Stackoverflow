library(factoextra)

PCAf <- read.table("PCA_small_sample.csv", sep = ";", header = T, row.names = 1)
res.pca <- prcomp(PCAf, scale = TRUE)#, center = F)

fviz_pca_biplot(res.pca)

res.var <- get_pca_var(res.pca)
res.var$coord          # Coordinates
res.var$contrib        # Contributions to the PCs

#####

data.matrix <- matrix(nrow=100, ncol=10)
colnames(data.matrix) <- c(
  paste("wt", 1:5, sep=""),
  paste("ko", 1:5, sep=""))
rownames(data.matrix) <- paste("gene", 1:100, sep="")
for (i in 1:100) {
  wt.values <- rpois(5, lambda=sample(x=10:1000, size=1))
  ko.values <- rpois(5, lambda=sample(x=10:1000, size=1))
  
  data.matrix[i,] <- c(wt.values, ko.values)
}
PCAf <- t(data.matrix)

res.pca_NC <- prcomp(PCAf, scale = TRUE, center = F)
res.pca_C <- prcomp(PCAf, scale = TRUE, center = T)

fviz_pca_biplot(res.pca_NC)
fviz_pca_biplot(res.pca_C)
