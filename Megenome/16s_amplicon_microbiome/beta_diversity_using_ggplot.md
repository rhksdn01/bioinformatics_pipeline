
# ggplop2를 이용하여 PCoA 그리기
<br/>

```
# ggplop2를 이용하여 PCoA 그리기
rm(list=ls())
data <- read.table("weighted_normalized_unifrac_otu,_table1.txt", header=T, row.names = 1)

uni.pco=pco(data,k=nrow(data)-1)

fea=read.table('metadata1.txt',header=TRUE,row.names=1,sep='\t')
# ggplot을 이용하여 그릴때는 metadata가 필요하다. metadata는 표현하고자하는 sample의 특이성을 나타내는 file
# ex) drag treat, sex, 등등 여부를 0 or 1(왼쪽 figure)로 또는 값(오른쪽 figure)으로 표현해 놓은 data를 말한다. 

data=data.frame(PC1=uni.pco$points[,1],PC2=uni.pco$points[,2],treat=fea[,1])

ggplot(data,aes(PC1, PC2 ,color=treat,size=1))+geom_point()+scale_colour_gradient(low="red",high="blue")
#ggplot(data, aes(x=~~, y=~~)  -> x축, y축 설정
```
<br/>