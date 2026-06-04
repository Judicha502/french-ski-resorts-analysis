#################################################
# STA118 - Outils informatiques de la statistique
# Projet : Stations de ski françaises 
# Auteur : Judicha Mamiharilala
#################################################

# Question 1 : Importation des données

ski <- read.table(
  "ski (2).txt",
  header = TRUE,
  sep = "\t",
  stringsAsFactors = FALSE
)
dim(ski)

# Question 2 : Vérification de l'unicité de KIDEN

length(ski$KIDEN)
length(unique(ski$KIDEN))

# Question 3 : Suppression de id et utilisation de KIDEN comme nom des lignes

rownames(ski) <- ski$KIDEN

ski$id <- NULL
dim(ski)
head(ski[,1:5])

# Question 4 : Vérification des données manquantes

sum(is.na(ski))
colSums(is.na(ski))

# Question 5 : Nombre total de pistes par niveau de difficulté

total_pistes <- c(
  Vertes = sum(ski$Nbvertes),
  Bleues = sum(ski$Nbbleues),
  Rouges = sum(ski$Nbrouges),
  Noires = sum(ski$Nbnoires)
)

total_pistes

# Diagramme camembert

couleurs <- c("lightgreen", "skyblue", "tomato", "black")

pie(
  total_pistes,
  col = couleurs,
  main = "Répartition des pistes par niveau de difficulté"
)

# Question 6 : Département ayant le plus de stations

table_dept <- table(ski$Departement)

max(table_dept)
names(which.max(table_dept))

# Question 7 : Département ayant les stations les moins hautes en moyenne

moy_altitude <- tapply(
  ski$Altstation,
  ski$Departement,
  mean
)

moy_altitude

min(moy_altitude)

names(which.min(moy_altitude))

# Question 8 : Matrice de corrélation des variables numériques

variables_num <- ski[, 2:20]

mat_cor <- cor(variables_num)

corrplot(
  mat_cor,
  method = "color",
  type = "upper",
  tl.cex = 0.7,
  tl.srt = 60
)

# Question 9 : Stations des Alpes du Nord proches d'un aéroport ou d'une gare

myst <- subset(
  ski,
  Massif == "Alpes du Nord" &
    (aeroport == "aeroport proche" | sncf == "sncf proche")
)

dim(myst)

head(myst[, c("KIDEN", "Massif", "sncf", "aeroport")])

# Question 10 : Stations de myst dont le nom termine par "se"

stations_se <- grep(
  "se$",
  myst$KIDEN,
  value = TRUE
)

stations_se

# Question 11 : Histogramme de l'altitude du sommet des pistes selon la neige artificielle

ggplot(ski, aes(x = Altsommetdespistes)) +
  geom_histogram(bins = 20, color = "white") +
  facet_wrap(~ Neigeartificielle) +
  labs(
    title = "Altitude du sommet des pistes selon la neige artificielle",
    x = "Altitude du sommet des pistes",
    y = "Nombre de stations"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

# Question 12 : Exportation du data.frame ski modifié

write.table(
  ski,
  file = "ski2.txt",
  sep = ";",
  row.names = FALSE,
  col.names = TRUE,
  quote = FALSE
)

list.files()


