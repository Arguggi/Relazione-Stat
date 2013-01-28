# Divide la lista usando i punti come intervalli
suddividi <- function(lista,punti) {
  split(lista,cut(lista,punti))
}

# Crea un lista di stringhe: intervalli[i]<nome<intervalli[i+1]
intervallo <- function(nome,intervalli) {
  nomi <- vector()
  for(i in 1:(length(intervalli)-1)) {
    nomi <- c(nomi,paste(intervalli[i],"<",nome,"<",intervalli[i+1]))
  }
  return(nomi)
}
  

# Test Logica-Matematica

mateRange <- c(-5,19.99,34)
logicaRange <- c(-5,19.99,34)

# Divido i dati a seconda del voto in matematica e logica 

logicaDivisi <- split(dati$Matematica,cut(dati$Logica,logicaRange))

test_mate <- sapply(logicaDivisi,suddividi,mateRange)
# sapply suddividi prende il vettore fatto da x livelli ed aggiunge
# sotto ogni numero n colonne, dove n sono le divisioni che fa secondo il 2
# parametro di suddividi (se il vettore è lungo 3, fa 2 divisioni).
# Quindi servono x-1 colonne, poi la matrice viene trasposta per estetica.
test_mate <- t(matrix(sapply(test_mate,length),ncol=length(logicaRange)-1))

colnames(test_mate) <- intervallo("Mate",mateRange)
row.names(test_mate) <- intervallo("Logica",logicaRange)

# Test Diploma-Test

testRange <- c(-10,65,100)
votoRange <- c(50,69.5,79.5,89.5,100.5)

votoDivisi <- split(dati$Test,cut(dati$Voto,votoRange))
test_test <- sapply(votoDivisi,suddividi,testRange)
#vedi sopra test_mate
test_test <- t(matrix(sapply(test_test,length),ncol=length(votoRange)-1))

colnames(test_test) <- intervallo("Test",testRange)
row.names(test_test) <- intervallo("Voto",votoRange)

# Test Sesso-Voto

votoDivisi2 <- split(dati$Voto,dati$Genere)
test_genere2 <- sapply(votoDivisi2,suddividi,votoRange)
test_genere <- matrix(sapply(test_genere2,length),ncol=2)

colnames(test_genere) <- c("Femmine","Maschi")
row.names(test_genere) <- intervallo("Voto",votoRange)

# Test Sesso-Medie

medie_mas <- colMeans(dati[dati$Genere == "M",][,3:8])
medie_fem <- colMeans(dati[dati$Genere == "F",][,3:8])

test_medie <- matrix(c(t(medie_mas),t(medie_fem)),ncol=2)

# Test Voto-CDL

testDivisi <- split(dati$Totale,dati$CDL)

test_cdl <- sapply(testDivisi,suddividi,testRange)

test_cdl <- matrix(sapply(test_cdl,length),ncol=length(levels(dati$CDL)))

colnames(test_cdl) <- levels(dati$CDL)
row.names(test_cdl) <- intervallo("Test",testRange)
