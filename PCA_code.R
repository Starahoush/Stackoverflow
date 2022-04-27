library(factoextra)

PCAf <- read.table("PCA_small_sample.csv", sep = ";", header = T, row.names = 1)
res.pca <- prcomp(PCAf, scale = TRUE)#, center = T)

fviz_pca_biplot(res.pca)
