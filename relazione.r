# Leggo i dati del file .csv
dati <- read.csv("dati.csv", header=TRUE, sep=" ")

# Creo delle nuove tabelle divise per corso di laurea
ammi <- dati[dati$CDL == "AMMINISTRAZIONE E CONTROLLO", ]
comm <- dati[dati$CDL == "COMMERCIO ESTERO", ]
cons <- dati[dati$CDL == "CONSULENZA AZ.LE E GIURIDICA", ]
econ <- dati[dati$CDL == "ECONOMIA", ]
ecoa <- dati[dati$CDL == "ECONOMIA AZIENDALE", ]
ecof <- dati[dati$CDL == "ECONOMIA E FINANZA", ]
ecog <- dati[dati$CDL == "ECONOMIA GEST. SERV. TURISTICI", ]
mark <- dati[dati$CDL == "MARKETING E GEST. IMPRESE", ]
stat <- dati[dati$CDL == "STAT. E INFORMATICA GEST. IMPRESE",]

# Calcolo le medie di ogni colonna numerica di ogni tabella

ammiMedie <- colMeans(ammi[,2:7]) 
commMedie <- colMeans(comm[,2:7]) 
consMedie <- colMeans(cons[,2:7]) 
econMedie <- colMeans(econ[,2:7]) 
ecoaMedie <- colMeans(ecoa[,2:7]) 
ecofMedie <- colMeans(ecof[,2:7]) 
ecogMedie <- colMeans(ecog[,2:7]) 
markMedie <- colMeans(mark[,2:7]) 
statMedie <- colMeans(stat[,2:7]) 
