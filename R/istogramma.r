crea_istogramma <- function(dataframe,colonna,dimensioni,nome) {

  percorso <- "../Immagini/"
  nome_immagine <- paste(percorso,nome,"-",colonna,"-ist.pdf",sep="")
  pdf(nome_immagine)

  grafico <- ggplot(dataframe,aes_string(x=colonna),geom="histogram")
  grafico <- grafico + geom_histogram(aes(fill=..count..)) + scale_fill_gradient("Osservazioni")
  #grafico <- grafico + geom_density(aes(y=..count..),adjust=1,colour="red")
  grafico <- grafico + xlab("Voti") + ylab("Osservazioni")

  print(grafico)
  dev.off()
return()
}

dati_istogramma <- function(dimensioni) {
  for(i in names(dati[,3:8])) {
    crea_istogramma(dati,i,dimensioni,"dati")
  }
}

divisi_istogramma <- function(dimensioni) {
  for(i in divisi) {
    nome <- i[1,9]
    for(colonna in names(i)[3:8]) {
      crea_istogramma(i,colonna,dimensioni,nome)
    }
  }
}
