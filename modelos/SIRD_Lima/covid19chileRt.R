# Estimation of the infected growth rate using a logistic function of time in days
# Using the rate change of infected people per day; rt = [I(t+1) - I(t)]/I(t) as a response variable
# rt = b*(S/N) - (g+d), where b = transmision rate, d=recovery rate of infected and d = death rate of infected

dat <- (covid19chile2)
dur <- nrow(dat)
modelbeta<-nls(RI~b2+(b1-b2)*(1-1/(1+exp(-b*(Time-t))))+b3+(b2-b3)*(1-1/(1+exp(-g*(Time-t1))))+b4+(b3-b4)*(1-1/(1+exp(-g1*(Time-t2)))) , data=covid19chile2, start=list(b1=0.45, b2=0.01, b=0.2, b3=0.1, g=1, g1=0.8, b4=0.0015, t=16, t1=45, t2=80), trace=TRUE, nls.control(maxiter=5000, minFactor = 1/50000))
#confCHILE<-confint(modelbetaRM, "b1", level=0.95)
bvch<-seq(1, dur-1, 1)
avBeta<-(predict(modelbeta, bv))
#avBeta1<-(predict(modelbeta1, bv))
par(mfrow=c(1,1))
plot(covid19chile2$Time, covid19chile2$RI, type="p", pch=19, col="gray40", bty="l", ylim=c(-0.05, 0.45), xlab="Días desde el 04/03/20", ylab="r(t)", tck=0.025)
#rect(49, -0.1, 60, 0.45, col="orange1", density=95, border=NA, angle=45, type="l")
points(covid19chile2$Time, covid19chile2$RI, type="p", pch=19, col="gray40", bty="l", ylim=c(-0.05, 0.45), xlab="Días desde el 04/03/20", ylab="r(t)", tck=0.025)
#text(33, 0.78, "a", cex=2)
abline(h=0, lwd=2, lty=3, col="black")

arrows(12, 0.40, 12, 0.34, length = 0.05, angle = 30, code = 2, cex=2.5, col="red", lwd=2)
text(12, 0.415, "Cierre de clases", cex=0.45, font=2)
arrows(16, 0.36, 16, 0.30, length = 0.05, angle = 30, code = 2, cex=2.5, col="red", lwd=2)
text(26, 0.37, "Estado de catastrofe", cex=0.45, font=2) 
#arrows(23, 0.26, 23, 0.20, length = 0.05,angle = 30, code = 2, cex=2.5, col="red", lwd=2)
#text(32, 0.27, "Cuarentenas localizadas", cex=0.45, font=2)
lines(bvch, avBeta, lwd=3, col="blue")
#arrows(66, 0.16, 66, 0.10, length = 0.05, angle = 30, code = 2, cex=2.5, col="red", lwd=2)
#text(71, 0.17, "Nuevas cuarentenas", cex=0.45, font=2)
#arrows(75, 0.16, 75, 0.10, length = 0.05, angle = 30, code = 2, cex=2.5, col="red", lwd=2)

summary(modelbeta)
#predbeta <- 1 - sum((predict(modelbeta) - CORVID19N1$RI2)^2)/sum((CORVID19N1$RI2 - mean(CORVID19N1$RI2))^2)
