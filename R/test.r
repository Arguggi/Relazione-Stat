suddividi <- function(lista,punti) {
  split(lista,cut(lista,punti))
}

# Test Logica-Matematica

mateRange <- c(-5,19.99,34)
logicaRange <- c(-5,11,22,34)

# Divido i dati a seconda del voto in matematica e logica 

logicaDivisi <- split(dati$Matematica,cut(dati$Logica,logicaRange))

test_mate <- sapply(logicaDivisi,suddividi,mateRange)
# sapply suddividi prende il vettore fatto da x livelli ed aggiunge
# sotto ogni numero n colonne, dove n sono le divisioni che fa secondo il 2
# parametro di suddividi (se il vettore è lungo 3, fa 2 divisioni).
# Quindi servono x-1 colonne, poi la matrice viene trasposta per estetica.
test_mate <- t(matrix(sapply(test_mate,length),ncol=length(logicaRange)-1))

colnames(test_mate) <- c("Mate<20","Mate>20")
row.names(test_mate) <- c("Logica<11","11<Logica<22","Logica>22")

# Test Diploma-Test

testRange <- c(-10,65,100)
votoRange <- c(50,70,80,90,100)

votoDivisi <- split(dati$Test,cut(dati$Voto,votoRange))

test_test <- sapply(votoDivisi,suddividi,testRange)

#vedi sopra test_mate
test_test <- t(matrix(sapply(test_test,length),ncol=length(votoRange)-1))

colnames(test_test) <- c("Test<60","Test>60")
row.names(test_test) <- c("Voto<70","70<Voto<80","80<Voto<90","Voto>90")

# Test Sesso-Voto

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

# Test Voto-CDL

testDivisi <- split(dati$Totale,dati$CDL)

test_cdl <- sapply(testDivisi,suddividi,testRange)

test_cdl <- matrix(sapply(test_cdl,length),ncol=length(levels(dati$CDL)))

colnames(test_cdl) <- levels(dati$CDL)
row.names(test_cdl) <- c("Test<65","Test>65")
