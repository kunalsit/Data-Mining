#  Course     : CS 513
#  First Name : Kunal
#  Last Name  : Goyal
#  Assignment : HW_08
#  Student ID : 10471054

## remove all objects
rm(list=ls())
dev.off
#read CSV file 
data<-read.csv("C://Users/kgoyal/R/wisc_bc_ContinuousVar.csv")
#Remove the rows with missing values NA
data=na.omit(data)

#8.1 ==> h_cluster
h_cluster=hclust(dist(data[,-c(1,2)]),method="average")
#Catagorised the data  into 2 clusters
plot(h_cluster)
rect.hclust(h_cluster, k = 2)
hclust_2<-cutree(h_cluster,2)
tabular_hcluster=table(clusters=hclust_2,diagnosis=data[,'diagnosis'])
print('hcluster Table and Plot')
print(tabular_hcluster)


#8.2 ==> Kmean
k_mean=kmeans(data[,-c(1,2)],2)
tabular_kmean=table(clusters=k_mean$cluster,diagnosis=data[,'diagnosis'])
print('K-mean Table and Plot')
print(tabular_kmean)

plot(data[c(3,4)],col=k_mean$cluster)
points(k_mean$centers,col=1:3,pch=16,cex=2)



