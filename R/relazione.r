# Leggo i dati del file .csv
dati_letti <- read.csv("../dati.csv", header=TRUE, sep=" ")

# Creo il data.frame
dati <- as.data.frame(dati_letti)

# Estraggo i nomi dei test
nomi_test <- colnames(dati[,3:7])

# Divido il data.frame per corso di laurea
divisi <- split(dati,dati$CDL)

# Creo il data frame con le medie diviso per CDL
for (i in divisi) {
  if(i$CDL[1] == "AMMINISTRAZIONE_E_CONTROLLO") {
    divisi_medie <- matrix(colMeans(i[,3:7]),nrow=1)
  }
  else {
    divisi_medie <- rbind(divisi_medie,colMeans(i[,3:7]))
  }  
} 

divisi_medie <- as.data.frame(divisi_medie)
