# Read genetic distance data 
dist <- read.csv(file = '../data/distance_matrix/fmdv_dist_col.csv', sep=',', header = TRUE)

# Read label class
label_class <- read.csv(file='../data/distance_matrix/labels_class.csv', sep=',', header = FALSE)

# Into dist matrix
dist.names <- unique(c(levels(dist[[1]]), levels(dist[[2]])))
dist.mat <- matrix(0, length(dist.names), length(dist.names))
dimnames(dist.mat) <- list(dist.names, dist.names)
dist.ind <- rbind(cbind(match(dist[[1]], dist.names), match(dist[[2]], dist.names)),
                  +                   cbind(match(dist[[2]], dist.names), match(dist[[1]], dist.names)))
dist.mat[dist.ind] <- rep(dist[[3]], 2)

# CMDScale
mds1 <- cmdscale(dist.mat, k=2)
plot(mds1[,1], mds1[,2])

# Experimenting with ggplot2
qplot(x=mds1[,1], y=mds1[,2], color=label_class$V2) + xlim(-0.05, 0.2) + ylim(-0.08, 0.08)

# Testing ggplot2
A = dist.mat[label_class$V2=='A',label_class$V2=='A']
mdsA <- cmdscale(A, k=2)
qplot(x= mdsA[,1], y=mdsA[,2]) + xlim(-0.05, 0.2) + ylim(-0.08, 0.08)
