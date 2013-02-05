crea_boxplot_tutti <- function(dataframe,colonna,dimensioni,nome) {

  percorso <- "../Immagini/"
  nome_immagine <- paste(percorso,nome,"-",colonna,"-box.png",sep="")
  png(nome_immagine,width=dimensioni, height=dimensioni, units="px")

  grafico <- ggplot(dataframe,aes_string(y=colonna,x="Genere"),geom="boxplot")
  grafico <- grafico + geom_boxplot(aes(fill=Genere))
  grafico <- grafico + xlab("Sesso") + scale_fill_discrete(name="Sesso")

  print(grafico)
  dev.off()
return()
}

dati_boxplot <- function(dimensioni) {
  for(i in names(dati[,3:8])) {
    crea_boxplot_tutti(dati,i,dimensioni,"dati")
  }
}

divisi_boxplot <- function(dimensioni) {
  for(i in divisi) {
    nome <- i[1,9]
    for(colonna in names(i)[3:8]) {
      crea_boxplot_tutti(i,colonna,dimensioni,nome)
    }
  }
}
