# Beta diversity
<br/>
### 1. Raw data (fastq) quality 확인
<br/>

---
<br/>
- R을 이용한 Beta diversity Analysis
<br/>

```
library(labdsv)
library(vegan)
library(xtable)
library(scatterplot3d)
library(reshape)
library(ggplot2)
#위 프로그램을 전부 쓰진 않지만 혹시 모르니까 다 실행시켜두기.

###beta-diversity


rm(list=ls()) # 우측 상단의 Environment 창에 있는 모든 Datasets 을 삭제(clear, delete)한다. 

# txt data를 R로 input
data <- read.table("weighted_normalized_unifrac_otu_table_1.txt", header=T, row.names=1)
# input한 txt 파일을 data라고 정의함.
# header는 txt파일의 맨 윗줄을 열이름으로 취급할지 여부를 결정합니다. txt파일을 header=T
# row.names와 col.names는 행과 열의 이름을 부여
# row.names=1 -> 1열을 Y 축의 값으로 설정

# pco(Principal Coordinates Analysis) 
uni.pco=pco(data,k=nrow(data)-1)
# usage : pco(data matrix, k=2)
# pco(dis ,k= 반환할 차원의 수)
# dis: the distance or dissimilarity matrix object of class "dist" returned from dist, vegdist, or dsvdis
# k: the number of dimensions to return
# nrow는 dataframe의 행의 수를 출력하는 함수입니다.
# 현재 input한 data의 행의 수는 42행임. 차원의 수는 변수의 갯수보다 적으면 commend가 실행됨.
# dis: the distance or dissimilarity matrix object of class "dist" returned from dist, vegdist, or dsvdis
#      그냥 input data에 대한 matrix

# 위 과정에서 
write.csv(uni.pco$points, file="weighted_normalized_unifrac_otu_table_1.csv")

plot(uni.pco$points[,1],uni.pco$points[,2],xlab="PC1",ylab="PC2", col="NA", pch=17, cex=1)
#uni.pco$points [,1] V1 축을 사용한다는 뜻, lab 축 이름, col 색, pch 모양, cex 크기. 빈 그래프를 만들어서 배경을 만들어주기 위한 작업.

plot(uni.pco$points[,1],uni.pco$points[,2],xlab="PC1",ylab="PC2", col="NA", pch=17, cex=1, xlim=c(-0.35, 0.4), ylim=c(-0.4, 0.5))
# xlim, ylim의 값은 c(최솟값, 최댓값) 형태로 지정. 그래프의 축 범위 지정해 줌. 

# plot의 title 지정
title(main = "Gut")

points(uni.pco$points[1:25,1],uni.pco$points[1:25,2],col="lime green",pch=19,cex=1.0)  
# [1:25,1] V1 축의 1-25번째 data 사용해서 x축과 y축에 point를 지정해줌
points(uni.pco$points[26:42,1],uni.pco$points[26:42,2],col="orange red",pch=19,cex=1.0) 
# [26:42,1] V3 축의 26-42번째; 17개의  data 사용해서 x축과 y축에 point를 지정해줌. 
# 각 sample(V1, V3)의 갯수를 정확히 넣어주어야 함. 넘어가면 point가 안생김

legend(-0.35, 0.5, c("AD","NC"), col=c("lime green","orange red"), pch=c(19,19), cex=0.8)
# legend(x좌표, y좌표, c(value1, value2), col=c("색", "색"), 
#         pch=c(value1 모양, value2 모양), cex=크기)

# figure의 각 값들의 아래에 이름을 넣어줌.
# 샘플이 많으면 아래는 생략할 것.
text(uni.pco$points[,1],uni.pco$points[,2],label=row.names(data),pos=1,cex=0.7)
```
<br/>

```
library(labdsv)
library(vegan)
library(xtable)
library(scatterplot3d)
library(reshape)
library(ggplot2)

rm(list=ls()) 

data <- read.table("weighted_normalized_unifrac_otu_table_1.txt", header=T, row.names=1)

uni.pco=pco(data,k=nrow(data)-1)

write.csv(uni.pco$points, file="weighted_normalized_unifrac_otu_table_1.csv")

plot(uni.pco$points[,1],uni.pco$points[,2],xlab="PC1",ylab="PC2", col="NA", pch=17, cex=1)
plot(uni.pco$points[,1],uni.pco$points[,2],xlab="PC1",ylab="PC2", col="NA", pch=17, cex=1, xlim=c(-0.35, 0.4), ylim=c(-0.4, 0.5))

title(main = "Gut")

points(uni.pco$points[1:25,1],uni.pco$points[1:25,2],col="lime green",pch=19,cex=1.0)    
points(uni.pco$points[26:30,1],uni.pco$points[26:30,2],col="orange red",pch=19,cex=1.0) 

legend(-0.35, 0.5, c("AD","NC"), col=c("lime green","orange red"), 
       pch=c(19,19), cex=0.8)

text(uni.pco$points[,1],uni.pco$points[,2],label=row.names(data),pos=1,cex=0.7)
```
<br/>