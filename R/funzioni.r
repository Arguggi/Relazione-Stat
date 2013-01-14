# crea_boxplot
  # lista         -> Dataframe di cui si vuole fare il boxplot
  # nome_immagine -> nome da dare all'immagine
  # dimensioni    -> dimensioni in px dell'immagine che si vuole creare
  # scala_y       -> vettore con il minimo e il massimo numero che si vuole sulla scala delle y
crea_boxplot <- function(lista,nome_immagine,dimensioni,scala_y) {

# Estrae il nome della lista e aggiunge .tiff
  nome_immagine <- paste(nome_immagine, ".tiff",sep="")
  tiff(nome_immagine,width=dimensioni, height=dimensioni, units="px", compression="none")

# Crea il grafico delle medie totali:
  # dati      -> Usa i dati contenuti in datiMedie
  # main      -> Titolo del grafico
  # col       -> Colore dei boxplot
  # axes      -> Disegna gli assi se è TRUE
  # xlab      -> Nome dell'asse x
  # ylab      -> Nome dell'asse y
  # ylim      -> Limiti della scala delle y
  # outline   -> FALSE non disegna gli outliers
  boxplot(lista, main="TITOLO", col="lightblue",axes=FALSE,  xlab="Test", ylab="Punteggio", ylim=scala_y,outline=FALSE)
  mtext("SOTTOTITOLO")
  box()
  
# Aggiunge i nomi delle colonne sull'asse x e y
  # 1      -> asse x (2 è l'asse y)
  # at     -> Indica dove mettere i nomi
  # labels -> Indica quali nomi mettere 
  numeri_x <- seq(1,length(lista),1)
  axis(1, at=numeri_x, labels=nomi_test)
  numeri_y <- seq(min(scala_y),max(scala_y),5)
  axis(2, at=numeri_y, labels=numeri_y, las=2)

# Aggiunge linee al grafice
  # h    -> linee orizzontali, (v per verticali)
  # col  -> colore delle linee
  # lty  -> tipo di linea
  # lwd  -> larghezza della linea rispetto a quella di default
  abline(h=numeri_y, col=1, lty=2, lwd=0.5)

# Salva l'immagine
  dev.off()
return()
}

# tutti_boxplot
  # lista    -> lista di liste
  # dimensioni    -> dimensioni dell'immagine che si vuole creare
  # scala_y       -> vettore con il minimo e il massimo numero che si vuole sulla scala delle y
tutti_boxplot <- function(lista,dimensioni,scala_y) {
  for(i in lista) {
    sottoLista <- i[,3:7]
    crea_boxplot(sottoLista,i$CDL[1],dimensioni,scala_y)
  }
}
