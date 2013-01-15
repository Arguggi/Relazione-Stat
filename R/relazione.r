# Leggo i dati del file .csv
dati_letti <- read.csv("../dati.csv", header=TRUE, sep=" ")

# Creo il data.frame
dati <- as.data.frame(dati_letti)

# Estraggo i nomi dei test
nomi_test <- colnames(dati[,3:7])

# Divido il data.frame per corso di laurea
divisi <- split(dati,dati$CDL)

# Creo il data frame con le medie diviso per CDL
for (lista in divisi) {
  if(lista$CDL[1] == "AMMINISTRAZIONE_E_CONTROLLO") {
    divisi_medie <- matrix(colMeans(lista[,3:7]),nrow=1)
  }
  else {
    divisi_medie <- rbind(divisi_medie,colMeans(lista[,3:7]))
  }  
} 

divisi_medie <- as.data.frame(divisi_medie)
divisi_medie <- cbind(divisi_medie, levels(dati$CDL)) # Aggiunge colonna CDL
names(divisi_medie)[6] <- "CDL" # Cambia nome della colonna in CDL
