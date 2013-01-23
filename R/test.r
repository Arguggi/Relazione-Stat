suddividi <- function(lista,punti) {
  split(lista,cut(lista,punti))
}

# Test Logica-Matematica

mateRange <- c(-5,19.99,34)
logicaRange <- c(-5,11,22,34)

# Divido i dati a seconda del voto in matematica e logica 

logicaDivisi <- split(dati$Matematica,cut(dati$Logica,logicaRange))

test_mate <- sapply(logicaDivisi,suddividi,mateRange)
test_mate <- t(matrix(sapply(test_mate,length),ncol=length(mateRange)))

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

# Test Sesso-Test

pernoTest <- 50

maschi <- subset(dati,Genere == "M")
femmine <- subset(dati, Genere == "F")

minf70 <- subset(maschi,Voto <= 70)
minf80 <- subset(maschi,Voto <= 80 & Voto > 70)
minf90 <- subset(maschi,Voto <= 90 & Voto > 80)
minf00 <- subset(maschi,Voto > 90)

testm <- c(length(minf70[,3]),length(minf80[,3]),length(minf90[,3]),length(minf00[,3]))

finf70 <- subset(femmine,Voto <= 70)
finf80 <- subset(femmine,Voto <= 80 & Voto > 70)
finf90 <- subset(femmine,Voto <= 90 & Voto > 80)
finf00 <- subset(femmine,Voto > 90)

testf <- c(length(finf70[,3]),length(finf80[,3]),length(finf90[,3]),length(finf00[,3]))

test_genere <- matrix(c(t(testm),t(testf)),ncol=2)

test_genere <- as.data.frame(test_genere)
colnames(test_genere) <- c("Maschi","Femmine")
row.names(test_genere) <- c("Voto<70","70<Voto<80","80<Voto<90","Voto>90")

# Test Sesso-Medie

medie_mas <- colMeans(dati[dati$Genere == "M",][,3:8])
medie_fem <- colMeans(dati[dati$Genere == "F",][,3:8])

test_medie <- matrix(c(t(medie_mas),t(medie_fem)),ncol=2)
