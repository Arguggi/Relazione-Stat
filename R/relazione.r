# Leggo i dati del file .csv
dati_letti <- read.csv("../dati.csv", header=TRUE, sep=" ")

# Creo il data.frame
dati <- as.data.frame(dati_letti)

# Estraggo i nomi dei test
nomi_test <- colnames(dati[,3:7])

# Divido il data.frame per corso di laurea
divisi <- split(dati,dati$CDL)

for (i in divisi) {
  if(i$CDL[1] == "AMMINISTRAZIONE_E_CONTROLLO") {
    divisi_medie <- data.frame(apply(i[,3:7],2,mean))
  }
  else {
  }  
} 

