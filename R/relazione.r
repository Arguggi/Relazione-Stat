# Leggo i dati del file .csv
dati_letti <- read.csv("../dati.csv", header=TRUE, sep=" ")
# Creo il data.frame
dati <- as.data.frame(dati_letti)

maturita <- function(colonne) {
  return(round((colonne[,2]-0.4*colonne[,1])/0.6))
}

estraiColonne <- function(lista,colonne) {
  return(lista[,colonne])
}

colVar <- function(matrice) {
  return(sapply(matrice,var))
}

#Aggiunge colonna del voto di maturita
dati$Voto <- maturita(dati[,6:7])
dati <- dati[,c(names(dati)[1:7],"Voto","CDL")]
# Divido il data.frame per corso di laurea
divisi <- split(dati,dati$CDL)

indiciTest <- 3:8

# Creo la matrice con le medie divise per CDL
  # lapply estrae dalla lista di data.frame le colonne dei test
  # sapply applica ad ogni sottolista colMeans
  # viene poi trasposta per far si che ogni CDL sia una riga
divisi_medie <- t(sapply(lapply(divisi,estraiColonne,indiciTest),colMeans))
divisi_medie <- rbind(divisi_medie,colMeans(dati[,indiciTest]))
# Avere i CDL nei nomi delle righe è superfluo
row.names(divisi_medie) <- 1:10 
divisi_medie <- as.data.frame(divisi_medie)
divisi_medie <- cbind(divisi_medie,c(levels(dati$CDL),"TOTALE")) # Aggiunge colonna CDL
names(divisi_medie)[7] <- "CDL" # Cambia nome della colonna in CDL

#Creo la matrice con le variazioni standard divise per CDL
divisi_var <- t(sapply(lapply(divisi,estraiColonne,indiciTest),colVar))
divisi_var <- rbind(divisi_var,sapply(dati[,indiciTest],var)) # Aggiunge riga dei totali
row.names(divisi_var) <- 1:10 
divisi_var <- as.data.frame(divisi_var)
divisi_var <- cbind(divisi_var,c(levels(dati$CDL),"TOTALE")) # Aggiunge colonna CDL

# Creo la matrice con le variazioni standard
divisi_dev <- sqrt(divisi_var[,1:6])
divisi_dev <- cbind(divisi_dev,c(levels(dati$CDL),"TOTALE")) # Aggiunge colonna CDL
