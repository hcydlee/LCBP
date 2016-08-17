#1 get data and auc
library(pROC)
data<-read.csv("C:/sli126/GitHub/LCBP/c389.csv",header=TRUE)
attach(data)
roc1<-roc(cancer_a1,estp,plot=FALSE,lty=1,auc=TRUE,legacy.axes=TRUE)
auc1<-paste('Area Under the Curve = ',round(as.numeric(roc1$auc),4))

#2 prepare file and layout
windowsFonts(Times=windowsFont('TT Times New Roman'))
tiff(file="C:/sli126/GitHub/LCBP/c389roc.tiff",res=300,width=2400,height=2400,compression="lzw")
#win.metafile(filename="C:/sli126/GitHub/LCBP/a163roc.png",width=6.7,height=9)
par(family='Times')
layout(matrix(c(1,2),byrow=TRUE,ncol=1),heights=c(1.2,5.6),respect=FALSE)

#3 draw title part
par(mar=c(0,0,0,0))
plot(log(0),xlim=c(0,10),ylim=c(0,13),xaxt="n",type="n",axes=FALSE,xlab="",ylab="")
text(x=5,y=3,labels="ROC Curve for Model",adj=c(0.5,0.5), cex=1.4,col=1,font=2)
text(x=5,y=1,labels=auc1,adj=c(0.5,0.5),cex=1.1,col=1,font=2)

#4 draw ROC plot
par(mai=c(1.02,1.25,0.05,0.3),mgp=c(1.5,0.5,0))
roc2<-roc(cancer_b1,estp,plot=TRUE,lty=1,auc=TRUE,legacy.axes=TRUE)



dev.off()


