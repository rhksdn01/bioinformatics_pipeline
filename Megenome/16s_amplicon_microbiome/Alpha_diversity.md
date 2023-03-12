

# Alpha diversity

### 1. Raw data (fastq) quality 확인
<br/>

---
<br/>
- R을 이용한 Alpha diversity Box plot
<br/>

```
# 여러 종류의 plot을 한번에 띄우고 싶다면 사용 
# 1행 2열의 빈 행렬을 만듭니다. 그리고 plot을 실행하면 순서데로 행렬이 채워지는 모습을 확인 가능
par(mfrow=c(2, 2))   # c(행, 열)

index=read.table("alpha_diversity.simple.txt", header=TRUE, row.names=1)
F1<- index[1:25,1]
F2<- index[26:41,1]
boxplot(F1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="chao1", ylab="OTUs", ylim=c(0,400))
boxplot(F1, col="green", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(F2, col="blue", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)


G1<- index[1:25,2]
G2<- index[26:41,2]
boxplot(G1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="ace", ylab="OTUs", ylim=c(0,400))
boxplot(G1, col="red", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(G2, col="yellow", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)

A1<- index[1:25,2]
A2<- index[26:41,2]
boxplot(A1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="simpson", ylab="OTUs", ylim=c(0,400))
boxplot(A1, col="Deep Pink", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(A2, col="sky blue", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)

B1<- index[1:25,2]
B2<- index[26:41,2]
boxplot(B1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="observed_otus", ylab="OTUs", ylim=c(0,400))
boxplot(B1, col="gold", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(B2, col="cyan", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)
```
<br/>

```
# 여러 종류의 plot을 한번에 띄우고 싶다면 사용 
# 1행 2열의 빈 행렬을 만듭니다. 그리고 plot을 실행하면 순서데로 행렬이 채워지는 모습을 확인 가능
par(mfrow=c(2, 2))   # c(행, 열)

index=read.table("alpha_diversity.simple.txt", header=TRUE, row.names=1)
F1<- index[1:25,1]
F2<- index[26:41,1]
boxplot(F1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="chao1", ylab="OTUs", ylim=c(0,400))
boxplot(F1, col="green", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(F2, col="blue", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)


G1<- index[1:25,2]
G2<- index[26:41,2]
boxplot(G1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="ace", ylab="OTUs", ylim=c(0,400))
boxplot(G1, col="red", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(G2, col="yellow", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)

A1<- index[1:25,2]
A2<- index[26:41,2]
boxplot(A1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="simpson", ylab="OTUs", ylim=c(0,400))
boxplot(A1, col="Deep Pink", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(A2, col="sky blue", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)

B1<- index[1:25,2]
B2<- index[26:41,2]
boxplot(B1, boxwex=0, varwidth=FALSE, notch=FALSE, outcol="white", whiskcol="white", staplecol="white", boxcol="white", main="observed_otus", ylab="OTUs", ylim=c(0,400))
boxplot(B1, col="gold", boxwex=0.3, add=TRUE, at=1-0.2, outcex=0.1)
boxplot(B2, col="cyan", boxwex=0.3, add=TRUE, at=1+0.15, outcex=0.1)

```
<br/>
#### ace에 대한 w.test 값 구하기

<br/>

```
index=read.table("NC_vs_AD.txt",header=TRUE,row.names=1)
G1<- index[1:20,2]
G2<- index[21:40,2]
wilcox.test(G1,G2)

###error : tie가 있어 정확한 p값을 계산할 수 없습니다 
### => w.test는 샘플값을 정렬(sort)한 뒤 중앙값(median)으로 검정통계량을 계산.
### => 이때, 동일한 정렬순서의 값이 있으면 통계량과 p-value값이 정확하지 않을 수 있다는 뜻
### => 샘플수가 작으면 문제가 될 수 있으나, 샘플 사이즈가 크면 무시해도 대세에 지장 없음.


<br/>