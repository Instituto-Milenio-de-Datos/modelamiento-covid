## Adaptado de Peter Turchin (https://github.com/pturchin/CSH-Covid-19-Project)
### Numerical solution of the SIRD model: Chile
### 24.III.2020 Correction: don't permit q<0

{#########  Solve the SIRD model for given parameter values
  #dat <- read.table(xxxxx, sep=",", header=TRUE, stringsAsFactors = 	FALSE)
  dat <- (covid19chile2)
  dur <- nrow(dat)
  
  ### Initial conditions and parameter valuse
  N <- 19500000  # total population = 19.5 mln (Chile)
  S0 <- N
  I0 <- 2
  D0 <- R0 <- 0
  beta0 <- 0.385
  b2 <- 0.01
  b3 <- 0.064
  b4 <-0.0205
  theta <- 0.163
  theta1 <- 0.952
  theta2 <- 0.410
  gamma <- 0.0715
  delta <- 0.00125
  q1 <- 0.9
  q2 <- 0.65
  b_date <- 24.574
  b_date1 <- 57.2559
  b_date2 <- 87.0589
  q_date <- 48
  theta_q <- 0.1
  
  ### Calculate trajectory
  model <- data.frame(Time = 1:dur, S=S0, I=I0, R=R0, D=D0)
  pred <- data.frame(Time = 1:dur, I=NA, R=NA, D=NA, C=NA, delC=NA,delD=NA)
  
  for(t in 1:(dur-1)){
    beta <- b2 + (beta0-b2)*(1-1/(1+exp(-theta*(t-b_date))))+b3+(b2-b3)*(1-1/(1+exp(-theta1*(t-b_date1))))+b4+(b3-b4)*(1-1/(1+exp(-theta2*(t-b_date2))))
    model$S[t+1] <- model$S[t] - beta*model$S[t]*model$I[t]/N
    model$I[t+1] <- model$I[t] + beta*model$S[t]*model$I[t]/N - (gamma+delta)*model$I[t]
    model$R[t+1] <- model$R[t] + gamma*model$I[t]
    model$D[t+1] <- model$D[t] + delta*model$I[t]
  }
  
  ### Data prediction
  pred <- data.frame(Time = 1:dur, I=NA, R=NA, D=NA, C=NA, delC=NA,delD=NA)
  for(t in 1:dur){
    q <- (q1 + (q2-q1)/(1+exp(-theta_q*(t-q_date))))#+(q3+(q3-q2)/(1+exp(-theta_q*(t-q_date1)))); if(q<0){q=0}
    pred$I[t] <- q*model$I[t]
    pred$R[t] <- q*model$R[t]
    pred$D[t] <- 1*model$D[t]
  }
  pred$C <- pred$I + pred$R + pred$D
  pred$delC[2:dur] <- pred$C[2:dur] - pred$C[1:(dur-1)]
  pred$delD[2:dur] <- pred$D[2:dur] - pred$D[1:(dur-1)]
  
  ### Plot results and calculate the fit
  par(mfrow=c(3,2))
  par(mar=c(4,6,2,4))
  #t <- 1:dur
  #beta <- b2 + (beta0-b2)*(1-1/(1+exp(-theta*(t-b_date))))+b3+(b2-b3)*(1-1/(1+exp(-theta1*(t-b_date1))))+b4+(b3-b4)*(1-1/(1+exp(-theta2*(t-b_date2))))
  #plot(t,beta, type="l", lwd=2, col="red", main="beta(t) y r(t)", cex.main=0.9, ylim=c(-0.15, 0.55), ylab="beta/r", tck=0.025, xlab="")
  #abline(v=seq(0,65, by=10), h=seq(-0.05,1,by=0.05), col="grey")
  #points(covid19chile2$Time, covid19chile2$RI, type="p", pch=21, col="gray60", bty="l", ylim=c(-0.15, 0.65), xlab="Días desde el 04/03/20", ylab="r", tck=0.025)
  #abline(h=0, lwd=1, lty=3, col="black")
  #arrows(24, 0.4, 24, 0.3, length = 0.05, angle = 30, code = 2, cex=2.5, col="darkgreen", lwd=2)
  #arrows(65, 0.28, 65, 0.20, length = 0.05, angle = 30, code = 2, cex=2.5, col="darkgreen", lwd=2, lty=1)
  #lines(bvch, avBeta, lwd=2, col="blue")
  plot(dat$Time,dat$I, type="p", pch=21, col="gray60", main="Infectados Activos", cex.main=0.9, xlab="",ylab="", ylim=c(0, 85000), tck=0.025)
  lines(pred$Time, pred$I, lwd=2, col="black")
  plot(dat$Time,dat$D, type="p", pch=21, col="gray60", main="Total de Fallecidos", cex.main=0.9, xlab="",ylab="", ylim=c(0, 4800), tck=0.025)
  lines(pred$Time, pred$D, lwd=2, col="black")
  plot(dat$Time,dat$delC, type="p", pch=21, col="gray60", main="Casos nuevos por día", cex.main=0.9, xlab="",ylab="", ylim=c(0, 8800), tck=0.025)
  lines(pred$Time, pred$delC, lwd=2, col="black")
  plot(dat$Time,dat$delD, type="p", pch=21, col="gray60", main="Fallecidos por Día", cex.main=0.9,xlab="",ylab="", ylim=c(0, 350), tck=0.025)
  lines(pred$Time, pred$delD, lwd=2, col="black")
  #plot(dat$Time,(dat$delD/dat$I), type="p", pch=21, col="gray50", main="Tasa diaria de mortalidad", cex.main=0.9, xlab="Días desde el 04/03/20",ylab="", ylim=c(0, 0.004), tck=0.025)
  #lines(pred$Time, (pred$delD/pred$I), lwd=2, col="black")
  plot(dat$Time,dat$C, type="p", pch=21, col="gray60", main="Casos Confirmados Totales", cex.main=0.9,xlab="Días desde el 04/03/20",ylab="", ylim=c(0, 250000), tck=0.025)
  lines(pred$Time, pred$C, lwd=2, col="black")
  plot(dat$Time,dat$R, type="p", pch=21, col="gray60", main="Recuperados", cex.main=0.9,xlab="Dias desde el 04/03/20",ylab="", ylim=c(0, 155000), tck=0.025)
  lines(pred$Time, pred$R, lwd=2, col="black")
  par(mfrow=c(1,1))
  
  predR2 <- data.frame(Var=c("I","D","delC","delD","C","R","Mean"), R2=NA)
  pred <- pred[2:dur,]
  dat <- dat[2:dur,]
  predR2$R2[1] <- 1 - sum((pred$I - dat$I)^2)/sum((dat$I - mean(dat$I))^2)
  predR2$R2[2] <- 1 - sum((pred$D - dat$D)^2)/sum((dat$D - mean(dat$D))^2)
  predR2$R2[3] <- 1 - sum((pred$delC - dat$delC)^2)/sum((dat$delC - mean(dat$delC))^2)
  predR2$R2[4] <- 1 - sum((pred$C - dat$C)^2)/sum((dat$C - mean(dat$C))^2)
  predR2$R2[5] <- 1 - sum((pred$R - dat$R)^2)/sum((dat$R - mean(dat$R))^2)
  #predR2$R2[6] <- 1 - sum((pred$delD - dat$delD)^2)/sum((dat$delD - mean(dat$delD))^2)
  predR2$R2[7] <- mean(predR2$R2[1:5])
  print(predR2, digits=5)
}

{ ### Plot b(t) and q(t) and the logistic function
  par(mfrow=c(1,1))
  t <- 1:dur
  beta <- b2 + (beta0-b2)*(1-1/(1+exp(-theta*(t-b_date))))+b3+(b2-b3)*(1-1/(1+exp(-theta1*(t-b_date1))))+b4+(b3-b4)*(1-1/(1+exp(-theta2*(t-b_date2))))
  
  plot(t,beta, type="l", lwd=3, col="orange3", main="Tasa de crecimiento (azul) y de transmisión (rojo)",xlab="Días desde el 4/03/2020", ylim=c(-0.1, 0.5), ylab="r(t)/b(t)", tck=0.025, bty="l")
  #abline(v=seq(0,65, by=10), h=seq(-0.05,1,by=0.05), col="grey")
  #rect(22, -0.1, 65, 0.7, col="palegreen1", density=95, border=NA, angle=45, type="l")
  #rect(72, -0.1, 110, 0.7, col="palegreen3", density=95, border=NA, angle=45, type="l")
  points(t,beta, type="l", lwd=3, col="red", main="Tasa de transmisión y exponencial",xlab="Días desde el 4/03/2020", ylim=c(-0.1, 0.5), ylab="r(t)/b(t)", tck=0.025, bty="l")
  points(covid19chile2$Time, covid19chile2$RI, type="p", pch=16, col="gray30", bty="l", ylim=c(-0.1, 0.5), xlab="Días desde el 04/03/20", ylab="r", tck=0.025)
  abline(h=0, lwd=2, lty=3)
  arrows(1, 0.36, 1, 0.43, length = 0.05, angle = 30, code = 2, cex=2.5, col="red", lwd=4)
  text(6.2, 0.375, "(g+d)")
  #arrows(55, 0.2, 55, 0.12, length = 0.05, angle = 30, code = 2, cex=2.5, col="black", lwd=4, lty=1)
  lines(bvch, avBeta, lwd=3, col="blue")
  
  q <- q1 + (q2-q1)/(1+exp(-theta_q*(t-q_date)))#+q3 + (q3-q2)/(1+exp(-theta_q*(t-q_date1)))
  q[q < 0] <- 0
  plot(t,(1-q), type="l", lwd=3, col="dark green", main="Tasa de sub-reporte", tck=0.025, bty="l", xlab="Días desde el 4/03/2020")
  #abline(v=seq(0,65, by=10), h=seq(0,1,by=0.01), col="grey")
  par(mfrow=c(1,1))
}


