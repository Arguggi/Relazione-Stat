# crea_istogramma
  # lista         -> Dataframe di cui si vuole fare l'istogramma
  # nome_immagine -> nome da dare all'immagine
  # dimensioni    -> dimensioni in px dell'immagine che si vuole creare
  # x_divisione   -> In quante colonne (più o meno) divide i dati
crea_istogramma <- function(lista,nome_immagine,dimensioni,x_divisione) {

# Estrae il nome della lista e aggiunge .tiff
  nome_immagine <- paste(nome_immagine, ".tiff",sep="")
  tiff(nome_immagine,width=dimensioni, height=dimensioni, units="px", compression="none")

# Crea l'istogramma
  # lista      -> Usa i dati contenuti in lista
  # main      -> Titolo del grafico
  # col       -> Colore dei istogramma
  # yaxt      -> Non disegna la scala dell'asse y se è ="n"
  # xlab      -> Nome dell'asse x
  # ylab      -> Nome dell'asse y
  # ylim      -> Limite della scala delle y
  # breaks    -> In quante colonne (più o meno) divide i dati
  numeroDati <- length(lista)
  scala_y=c(0,as.integer(numeroDati/2.5)) # A seconda del numero di dati decide il numero massimo sulle y
  hist(lista, main="TITOLO", col="lightblue",yaxt="n", xlab="Test", ylab="#", ylim=scala_y, breaks=x_divisione)
  mtext("SOTTOTITOLO") # Aggiunge sottotitolo
  box()

# Disegna la scala delle ordinate  
  numeri_y <- seq(0,max(scala_y),5)
  axis(2, at=numeri_y, labels=numeri_y, las=2)

# Salva l'immagine
  dev.off()
return()
}

indiciIstogramma <- 3:8

tutti_istogramma <- function(lista,dimensioni,x_divisione){
  for(sottoLista in lista) { # Ciclo per le sottoliste
    nomiColonne <- names(sottoLista)
    for(colonna in indiciIstogramma) {    # Ciclo per le singole colonne
      nome <- paste(sottoLista$CDL[1],nomiColonne[colonna],sep="_")
      crea_istogramma(sottoLista[,colonna],nome,dimensioni,x_divisione)
    }
  }
}

    

