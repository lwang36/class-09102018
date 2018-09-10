Class 09/10/2018

library(SpikeInSubset)
data(spikein95)

rma.eset <- rma(spikein95)
rma.e <- exprs(rma.eset)

d <- rowMeans(rma.e[,1:3]) - rowMeans(rma.e[,4:6])
a <- rowMeans(rma.e)
source("https://bioconductor.org/biocLite.R")

biocLite("genefilter")
library("genefilter")
# pData(rma.eset) <- pData(mas5.eset)
tt <- rowMeans(rma.e)
lod <- tt
plot(d, a, cex = 0.5, main = "Volcano plot for MA", xlim = c(-2, 2), xlab = "M", ylab = "A", yaxt = "n")
axis(2, at = seq(0, 3, by = 1), labels = 10^(-seq(0, 3, by = 1)))
# points(d[spikedIndex], lod[spikedIndex], pch = 19, col = "red")
abline(h = 2, v = c(-1, 1))


library(affy)
setwd("C:/Users/Ling/Desktop/estrogen")
targetsFile <- "estrogen.txt"
pd <- read.AnnotatedDataFrame(targetsFile, header=TRUE, sep="", row.names=1)
pData(pd)


ER <- pData(pd)$estrogen
Time <- factor(pData(pd)$time.h)
design <- model.matrix(~ER+Time)
design
design2 <- model.matrix(~ER*Time)
design2

raw <- ReadAffy(celfile.path= "C:/Users/Ling/Desktop/estrogen",
filenames=rownames(pData(pd)), phenoData = pd)

boxplot(raw,col= "red")













