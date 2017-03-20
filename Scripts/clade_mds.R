library('ggplot2')

# Read genetic distance data 
dist <- read.csv(file = '../data/Asia1/Distance_Data_col.csv', sep=',', header = TRUE)

# Read label class
label_class <- read.csv(file='../data/Asia1/asia_1.csv', sep=',', header = FALSE)

# Into dist matrix
dist.names <- unique(c(levels(dist[[1]]), levels(dist[[2]])))
dist.mat <- matrix(0, length(dist.names), length(dist.names))
dimnames(dist.mat) <- list(dist.names, dist.names)
dist.ind <- rbind(cbind(match(dist[[1]], dist.names), match(dist[[2]], dist.names)),
                  +                   cbind(match(dist[[2]], dist.names), match(dist[[1]], dist.names)))
dist.mat[dist.ind] <- rep(dist[[3]], 2)

# CMDScale
mds1 <- cmdscale(dist.mat, k=3)
plot(mds1[,1], mds1[,2])

# Experimenting with ggplot2
qplot(x=mds1[,1], y=mds1[,2],  color = label_class$V2, size=I(3)) + xlab('Dimension 1') + ylab('Dimension 2') + ggtitle('MDS Representation of FMDV Type O Sequence\'s Genetic Distance') + theme(legend.title=element_blank())

# Experimenting with plotly
library(plotly)
plot_ly(as.data.frame(mds1), x=mds1[,1], y=mds1[,2], z=mds1[,3], color=label_class$V2)


#shape=label_class$V2,
# Testing ggplot2
A = dist.mat[label_class$V2=='A',label_class$V2=='A']
mdsA <- cmdscale(A, k=2)
qplot(x= mdsA[,1], y=mdsA[,2]) + xlim(-0.05, 0.2) + ylim(-0.08, 0.08)

