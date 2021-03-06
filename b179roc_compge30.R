#1 get data and auc
library(pROC)
data<-read.csv("C:/sli126/GitHub/LCBP/b179.csv",header=TRUE)
attach(data)
y=-6.8272+0.0391*age+0.7917*smokec+1.3388*ch+0.1274*diasumm+1.0407*spiculation+0.7838*slobec
accpp=exp(y)/(1+exp(y))
data<-cbind(data,accpp)
rm(y,accpp)
data<-data[which(diasumm>=30),]
attach(data)

roc1<-roc(cancer_b,estp,plot=FALSE,lty=1,auc=TRUE,legacy.axes=TRUE)
roc2<-roc(cancer_b,accpp,plot=FALSE,lty=1,auc=TRUE,legacy.axes=TRUE)
auc1<-paste('LCBP AUC =',round(as.numeric(roc1$auc),4))
auc2<-paste('ACCP AUC =',round(as.numeric(roc2$auc),4))

#2 prepare file and layout
windowsFonts(Times=windowsFont('TT Times New Roman'))
tiff(file="C:/sli126/GitHub/LCBP/b179roc_compge30mm.tiff",res=300,width=1680,height=2400,compression="lzw")
#win.metafile(filename="C:/sli126/GitHub/LCBP/a163roc.png",width=6.7,height=9)
par(family='Times')
layout(matrix(c(1,2,3),byrow=TRUE,ncol=1),heights=c(1.2,5.6,1.2),respect=FALSE)

#3 draw title part
par(mar=c(0,0,0,0))
plot(log(0),xlim=c(0,10),ylim=c(0,13),xaxt="n",type="n",axes=FALSE,xlab="",ylab="")
text(x=5,y=3,labels=paste("ROC Curves of LCBP and ACCP from Validation set 1(>=30mm),N=",nrow(data)),adj=c(0.5,0.5), cex=1.4,col=1,font=2)


#4 draw ROC plot
par(mai=c(1.02,1.25,0.05,0.3),mgp=c(1.5,0.5,0))
roc1<-roc(cancer_b,estp,plot=TRUE,lty=1,auc=TRUE,legacy.axes=TRUE,asp=1,
          grid=TRUE)
roc2<-roc(cancer_b,accpp,plot=TRUE,lty=2,auc=TRUE,legacy.axes=TRUE,add=TRUE)
test12<-as.numeric(roc.test(roc1,roc2,method="delong",alternative = c("two.sided", "less", "greater"))$p.value) 
footn<-paste("ROC compare p value =",round(test12,4))
#5 Legends
lgd<-c(auc1,auc2)
legend(0.5,0.03,lgd,ncol=1,bg='white',lwd=1,lty=c(1,2),xjust=0,cex=1.4,yjust=0,xpd=TRUE)

#6 Footnote
par(mar=c(0,0,0,0),mgp=c(1.5,0.5,0))
plot(log(0),xlim=c(0,10),ylim=c(0,5),xaxt='n',type='n',axes=FALSE,xlab='',ylab='')
segments(0,4.9,10,4.9,lwd=1.5)
text(x=0,y=4.7,labels=footn,adj=c(0,1),font=1,col=1,cex=1.3)


dev.off()


