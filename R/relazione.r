# Leggo i dati del file .csv
dati_letti <- read.csv("../dati.csv", header=TRUE, sep=" ")

# Creo il data.frame
dati <- as.data.frame(dati_letti)

# Estraggo i nomi dei test
nomi_test <- colnames(dati[,3:7])

# Divido il data.frame per corso di laurea
divisi <- split(dati,dati$CDL)

# Creo la matrice con le medie divise per CDL
for (lista in divisi) {
  if(lista$CDL[1] == "AMMINISTRAZIONE_E_CONTROLLO") {
    divisi_medie <- matrix(colMeans(lista[,3:7]),nrow=1)
  }
  else {
    divisi_medie <- rbind(divisi_medie,colMeans(lista[,3:7]))
  }  
} 
divisi_medie <- rbind(divisi_medie,colMeans(dati[,3:7]))
divisi_medie <- as.data.frame(divisi_medie)
divisi_medie <- cbind(divisi_medie,c(levels(dati$CDL),"TOTALE")) # Aggiunge colonna CDL
names(divisi_medie)[6] <- "CDL" # Cambia nome della colonna in CDL

#Equivalente di colMeans
colVAR <- function(lista) {
  Varianze <- matrix(var(lista[,1]),nrow=1)
  for(colonna in lista[,2:5]){
    Varianze <- cbind(Varianze,var(colonna))
  }
  return(Varianze)
}

#Creo la matrice con le variazioni standard divise per CDL
for (lista in divisi) {
  if(lista$CDL[1] == "AMMINISTRAZIONE_E_CONTROLLO") {
    divisi_var <- matrix(colVAR(lista[,3:7]),nrow=1)
  }
  else { 
    divisi_var <- rbind(divisi_var,colVAR(lista[,3:7]))
  }
}

divisi_var <- as.data.frame(divisi_var)
divisi_var <- cbind(divisi_var, levels(dati$CDL)) # Aggiunge colonna CDL
names(divisi_var) <- names(dati)[3:8] # Cambia nome delle colonne

# Creo la matrice con le variazioni standard
divisi_dev <- sqrt(divisi_var[,1:5])
divisi_dev <- cbind(divisi_dev, levels(dati$CDL)) # Aggiunge colonna CDL

