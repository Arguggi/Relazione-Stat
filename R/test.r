# Test Logica-Matematica
minf20 <- subset(dati,Matematica < 20)
msup20 <- subset(dati,Matematica >= 20)

linf11 <- subset(minf20,Logica <= 11)
linf22 <- subset(minf20,Logica <= 22 & Logica > 11)
linf34 <- subset(minf20,Logica <= 34 & Logica > 22)

mat0 <- c(length(linf11[,3]),length(linf22[,3]),length(linf34[,3]))

lsup11 <- subset(msup20,Logica <= 11)
lsup22 <- subset(msup20,Logica <= 22 & Logica > 11)
lsup34 <- subset(msup20,Logica <= 34 & Logica > 22)

mat20 <- c(length(lsup11[,3]),length(lsup22[,3]),length(lsup34[,3]))

test_mate <- matrix(c(t(mat0),t(mat20)),ncol=2)

test_mate <- as.data.frame(test_mate)
colnames(test_mate) <- c("Mate<20","Mate>20")
row.names(test_mate) <- c("Logica<11","11<Logica<22","Logica>22")

# Test Diploma-Test

pernoTest <- 50

tinf <- subset(dati,Test < pernoTest)
tsup <- subset(dati,Test >= pernoTest)

dinf70 <- subset(tinf,Voto <= 70)
dinf80 <- subset(tinf,Voto <= 80 & Voto > 70)
dinf90 <- subset(tinf,Voto <= 90 & Voto > 80)
dinf00 <- subset(tinf,Voto > 90)

testinf <- c(length(dinf70[,3]),length(dinf80[,3]),length(dinf90[,3]),length(dinf00[,3]))

dsup70 <- subset(tsup,Voto <= 70)
dsup80 <- subset(tsup,Voto <= 80 & Voto > 70)
dsup90 <- subset(tsup,Voto <= 90 & Voto > 80)
dsup00 <- subset(tsup,Voto > 90)

testsup <- c(length(dsup70[,3]),length(dsup80[,3]),length(dsup90[,3]),length(dsup00[,3]))

test_test <- matrix(c(t(testinf),t(testsup)),ncol=2)

test_test <- as.data.frame(test_test)
colnames(test_test) <- c("Test<60","Test>60")
row.names(test_test) <- c("Voto<70","70<Voto<80","80<Voto<90","Voto>90")
