# Serve per salvare il grafico come immagine
  # Grafico_    -> Nome del file
  # width       -> larghezza dell'immagine
  # height      -> altezza dell'immagine
  # units       -> unità di misure di altezza e larghezza (Pixel)
  # compression -> algoritmo di compressione (Nessuno)
tiff("Grafico_Medie_Totali.tiff", width=480, height=480, units="px", compression="none")

# Crea il grafico delle medie totali:
  # dati      -> Usa i dati contenuti in datiMedie
  # main      -> Titolo del grafico
  # col       -> Il colore dei boxplot
  # axes      -> Disegna gli assi se è TRUE
  # xlab      -> Nome dell'asse x
  # ylab      -> Nome dell'asse y
  # outline   -> FALSE non disegna gli outliers
boxplot(dati[,3:7], main="Medie Globali", col="lightblue",axes=FALSE,  xlab="Test", ylab="Punteggio", outline=FALSE)

# Disegna il rettangolo
box()

# Aggiunge i nomi delle colonne sull'asse x e y
  # 1      -> asse x (2 è l'asse y)
  # at     -> Indica dove mettere i nomi
  # labels -> Indica quali nomi mettere 
numeri_x <- seq(1,5,1)
axis(1, at=numeri_x, labels=labels(datiMedie[2:6]))
numeri_y <- seq(-5,105,5)
axis(2, at=numeri_y, labels=numeri_y, las=2)

# Aggiunge linee al grafice
  # h    -> linee orizzontali, (v per verticali)
  # col  -> colore delle linee
  # lty  -> tipo di linea
  # lwd  -> larghezza della linea rispetto a quella di default
abline(h=numeri_y, col=1, lty=2, lwd=0.5)

# Salva l'immagine
dev.off()
