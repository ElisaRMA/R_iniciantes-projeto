## Script projeto Bibliometrix

#pacotes
install.packages("bibliometrix", dependencies=TRUE) ### instala o pacote bibliometrix e as dependencias
library(bibliometrix)   ### carrega o pacote bibliometrix

#Aquisição dos dados
WoS.plant.metab <- readFiles("C:/Users/elisa/Documents/R Directory/R_iniciantes-projeto/savedrecs.bib")
plant.metab.df <- convert2df(WoS.plant.metab, dbsource = "isi", format = "bibtex") # O objeto é convertido a dataframe

#Bibliometric Analysis 
bibl.plant.metab <- biblioAnalysis(plant.metab.df, sep = ";") # calcula os dados bibliometricos principais

#Summary e Plot
options(width=100)
sum.plant.metab <- summary(object = bibl.plant.metab, k = 10, pause = FALSE) #summarize main results of the bibliometric analysis. It displays main information about the bibliographic data frame  
plot(x = bibl.plant.metab, k = 10, pause = FALSE) #plot basic graphs

# Produção dos autores ao longo do tempo
topAU <- authorProdOverTime(plant.metab.df, k = 10, graph = TRUE)

#Network de co-citação
NetMatrix <- biblioNetwork(plant.metab.df, analysis = "co-citation", network = "references", sep = ";")
net=networkPlot(NetMatrix, n = 30, Title = "Co-Citation Network", type = "fruchterman", size=T, remove.multiple=FALSE, labelsize=0.7,edgesize = 5)

